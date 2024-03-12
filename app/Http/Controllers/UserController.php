<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Post;
use App\Models\Follower;
use App\Models\Notification;
use Illuminate\Support\Facades\View;
use Illuminate\Foundation\Auth\VerifiesEmails;

class UserController extends Controller
{
    use VerifiesEmails;
    // CREATE
    public function store(Request $request){

        try{
            $request->validate([
                'name' => ['required', 'string', 'max:255'],
                'user_name' => ['required', 'string', 'max:255', 'unique:users'],
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
                'password' => ['required', 'string', 'min:8', 'confirmed'],
                'password_confirmation' => ['required', 'string', 'min:8'],
            ]);

            $dados = $request->only(['name', 'user_name', 'email', 'phone', 'password', 'site', 'biography', 'sexo', 'birth_date']);
            $dados['password'] = Hash::make($dados['password']);
            $dados_login = $request->only(['email', 'password']);

            
            $new_user = User::create($dados);
            $this->setNotification($new_user->id, '../img/pacoca-fundo.png', 'Seja bem vindo ao Paçoca, sua nova rede social', '/pacoca', '/pacoca');

            if (Auth::attempt($dados_login, 1)) {
                $request->session()->regenerate();
    
                return redirect('/email/verify');
            }
            return redirect()->route('login')->with('conta-create-success', 'Conta criada com sucesso');
            
        } catch (Exception $e){
            return redirect()->route('login')->with('conta-create-danger', 'Erro ao criar conta');
        }
    }

    public function login(Request $request){
        $dados = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required']
        ]);

        if (Auth::attempt($dados, $request->filled('remember'))) {
            $request->session()->regenerate();

            return redirect()->intended('');
        }

        return back()->withErrors([
            'password' => 'O email e/ou senha são invalidos'
        ])->withInput();
    }

    public function account($user_name){
        $user = User::where('user_name', $user_name)
            ->get()
            ->first();

        if($user){
            $posts = User::join('posts', 'users.id', '=', 'posts.id_user')
                ->select('users.*', 'posts.*')
                ->where('id_user', $user->id)
                ->orderByDesc('posts.id')
                ->get();

            return view('user.account', ['user' => $user, 'posts' => $posts]);
        }else{
            return view('errors.404');
        }
    }

    // SAIR DA CONTA
    public function logout(Request $request){
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }

    public function search(){

        if(isset($_GET['search'])){
            $users = User::where('name', 'like', '%'. $_GET['search'] . '%')
                ->orWhere('phone', 'like', '%'. $_GET['search'] . '%')
                ->orWhere('user_name', 'like', '%'. $_GET['search'] . '%')
            ->get();
        }else{
            return view('user.search_mobile');
        }
        return view('user.search', ['users' => $users]);
    }

    // Função pra seguir
    public function follow_user(Request $request){
        // Verifica se usuário já está seguindo
        $usuario_seguido = Follower::where('id_user', auth()->user()->id)
            ->where('id_following', $request->id_user)
            ->first();
        $user = User::where('id', $request->id_user)->first();

        // Caso seteja seguindo, deixa de seguir
        if($usuario_seguido){
            // Deixa de seguir
            $usuario_seguido->delete();
            return response()->json(['message' => 'unfollow']);
        }else{
            // Salva no banco
            Follower::create([
                'id_user' => auth()->user()->id,
                'id_following' =>$request->id_user
            ]);

            // NOTIFICAÇÃO
            $id_user = $request->id_user;

            if(auth()->user()->img_account){
                $img = auth()->user()->img_account;
            }else{
                $img = '../img/img-account.png';
            }

            $text = auth()->user()->name . " começou a te seguir";
            $link1 = "/" . auth()->user()->user_name;
            $link2 = "https://pacoca.x10.mx/" . auth()->user()->user_name;

            if(auth()->user()->img_account){
                $img = "https://pacoca.x10.mx/" . $user->img_account;
            }else{
                $img = 'https://pacoca.x10.mx/img/img-account.png';
            }

            $caractereParaRemover = "../";
            $img_account = str_replace($caractereParaRemover, '', $img);

            
            if(auth()->user()->id != $user->id){
                $this->setNotification($id_user, $img, $text, $link1, $link2);

                return response()->json(
                    [
                        'message' => 'follow', 
                        'email_notification' => $user->email,
                        'subject' => $text,
                        'text' =>   "",
                        'link1' => $img_account,
                        'link2' =>  $link2,
                    ]
                );
            }


            return response()->json(['message' => 'follow']);
        }

    }

    // Pega todos os seguidores de um usuário
    public function getFollowers($id_user){
        $followers = Follower::where('id_following', $id_user)->get();

        return $followers;
    }

    // Pega todos que um usuario esta seguindo
    public function getFollowing($id_user){
        $following = Follower::where('id_user', $id_user)->get()->count();

        return $following;
    }

    // Verifica se usuario logado está seguindo outro usuário
    public function is_following($id_user){
        $usuario_seguido = Follower::where('id_user', auth()->user()->id)
            ->where('id_following', $id_user)
            ->get()
            ->count();

            return $usuario_seguido;
    }

    public function edit(Request $request){
        try{
            $request->validate([
                'name' => ['required', 'string', 'max:255'],
                'user_name' => ['required', 'string', 'max:255', Rule::unique('users')->ignore(auth()->id())],
                'email' => ['required', 'string', 'email', 'max:255', Rule::unique('users')->ignore(auth()->id())],
                'phone' => ['required', 'string', 'max:255'],
                'password' => ['required', 'string', 'min:8', 'confirmed'],
                'password_confirmation' => ['required', 'string', 'min:8'],
                'site' => ['max:255'],
                'biography' => ['max:255'],
                'sexo' => ['max:255'],
                'birth_date' => ['required', 'date']
            ]);

            $user = User::where('id', $request->id_user)->get()->first();
            
            $user->update([
                'name' => $request->name,
                'user_name' => $request->user_name,
                'email' => $request->email,
                'phone' => $request->phone,
                'password' => Hash::make($request->password),
                'site' => $request->site,
                'biography' => $request->biography,
                'sexo' => $request->sexo,
                'birth_date' => $request->birth_date,
            ]);


            return redirect('/' . $request->user_name)->with('success', 'Conta editada com sucesso');
        }

        catch(Exception $e){
            return redirect()->route('account')->with('danger', 'Não foi possível editar conta');
        }
    }

    // Edita imagem da conta
    public function edit_image(Request $request){

        $request->validate([
            'img' => ['required']
        ]);

        $user = User::find(auth()->user()->id);

        // CASO TENHA IMAGEM NO POST
        if($request->hasFile('img') ){
            if($request->file('img')->isValid()){
                $img = $request->img;
                $extension = $img->extension();
                $imgName = auth()->user()->id . ".png";
                $path = public_path('img/img_account');

                $request->img->move($path, $imgName);

                $user->update([
                    'img' => "../img/img_account/" . $imgName,
                ]);

                return redirect('/' . auth()->user()->user_name)->with('success', 'Imagem alterada com sucesso!');
            }else{
                return redirect('/' . auth()->user()->user_name)->with('danger', 'Não foi possível alterar imagem!');
            }
        }

        echo $request->img;
    }

    public function getUserById($id){
        $user = User::find($id);
        return $user;
    }

    public function getUserByUserName($user_name){
        $user = User::where('user_name', $user_name)->get()->first();
        return $user;
    }


    public function searchByUsername($username) {
        $users = User::where('user_name', 'like', "%$username%")->pluck('user_name');
        return response()->json(['usernames' => $users]);
    }
    

    public function dateDifference($date){
        $date = \Carbon\Carbon::parse($date);
        $data_atual = \Carbon\Carbon::now();
        $diferenca = $date->diff($data_atual);
        $diferenca_anos = $date->diffInYears($data_atual);
        $result = "";

        if($diferenca_anos >0){
            $result = "$anos anos";
        }
        
        else if($diferenca->days >0){
            $result = "$diferenca->days d";
        }
        
        else if($diferenca->h){
            $result = "$diferenca->h h";
        }
        
        else if($diferenca->i){
            $result = "$diferenca->i m";
        }
        
        else{
            $result = "Agora";
        }

        return $result;
    }

    public function setNotification($id_user, $img_notification, $text, $link1, $link2){
        // $id_user, $text, $link1, $link2, $read
        $read = 0;
        $opened = 0;

        $notifications = Notification::create([
            'id_user' => $id_user,
            'img_notification' => $img_notification,
            'text' => $text,
            'link1' => $link1,
            'link2' => $link2,
            'opened' => 0,
            'read' => $read,
        ]);

        return $notifications;
    }

    public function tagUser($username){
    // Encontre o usuário alvo pelo username
    $usuarioAlvo = User::where('username', $username)->first();

    if ($usuarioAlvo) {
        // Lógica para associar a marcação ao usuário alvo
        // (Isso pode envolver adicionar uma entrada a uma tabela pivot ou similar)
        // Exemplo: $usuarioLogado->marcacoes()->attach($usuarioAlvo);

        return response()->json(['message' => 'Usuário marcado com sucesso.']);
    } else {
        return response()->json(['message' => 'Usuário não encontrado.'], 404);
    }
}
}
