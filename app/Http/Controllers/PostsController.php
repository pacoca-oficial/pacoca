<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Post;
use App\Models\User;
use App\Models\PostLike;
use App\Models\Comment;
use App\Http\NavigationController;
use App\Models\Notification;
use App\Models\ImagePost;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail; // Import the Mail class

class PostsController extends Controller
{
    // FEED com os posts
    public function feed(){
        $posts = User::join('posts', 'users.id', '=', 'posts.id_user')
            ->select('users.*', 'users.id as id_user', 'posts.*')
            ->orderByDesc('posts.id')
            ->get();

        return view('feed', ['posts' => $posts]);
    }

    public function view_post($post_id){
        $posts = User::join('posts', 'users.id', '=', 'posts.id_user')
            ->select('users.*', 'users.id as id_user', 'posts.*')
            ->where('posts.id', $post_id)
            ->orderByDesc('posts.id')
            ->get();

        return view('user/view_post', ['posts' => $posts]);
    }

    public function getImagesPost($id_post){
        $images = ImagePost::where('id_post', $id_post)->get();

        return $images;
    }
    
    //CURTIR POST
    public function like(Request $request){
        $likes = PostLike::where('id_post', $request->id_post)->where('id_user', auth()->user()->id)->get()->first();

        if($likes){
            $likes->delete();
            return response()->json(['message' => 'deslikeSuccess']);
        }else{

            $like = PostLike::create([
                'id_user' => auth()->user()->id,
                'id_post' => $request->id_post,
            ]);

            // NOTIFICAÇÃO
            $user_post = Post::where('id',$request->id_post)->get()->first();
            $user = User::where('id', $user_post->id_user)->first();
            $email_controller = app(EmailController::class);

            $id_user = $user_post->id_user;

            if(auth()->user()->img_account){
                $img = "https://pacoca.x10.mx/" . $user->img_account;
            }else{
                $img = 'https://pacoca.x10.mx/img/img-account.png';
            }

            $text = auth()->user()->name . " curtiu sua publicação";
            $link1 = "/" . auth()->user()->user_name;
            $link2 = "https://pacoca.x10.mx/post/" . $request->id_post;

            $caractereParaRemover = "../";
            
            $img_account = str_replace($caractereParaRemover, '', $img);
            

            if(auth()->user()->id != $user_post->id_user){
                $this->setNotification($user_post->id_user, $img, $text, $link1, $link2);

                return response()->json(
                    [
                        'message' => 'likeSuccess', 
                        'email_notification' => $user->email,
                        'subject' => 'Você recebeu uma curtida na sua publicação',
                        'text' =>   $text,
                        'link1' => $img_account,
                        'link2' =>  $link2,
                    ]
                );
            }

            return response()->json(
                [
                    'message' => 'likeSuccess'
                ]
            );
        }
        
    }

    // COMENTAR POST
    public function comment(Request $request){
        // Verifica se post existe
        $post = Post::where('id', $request->id_post)->first();

        

        if($post){
            $comment = Comment::create([
                'id_post' => $request->id_post,
                'id_user' => auth()->user()->id,
                'text' => $request->comment,
            ]);

            
        
            $padrao_tag_user = '/(@[^\s]+)/';
            $texto_formatado = preg_replace_callback($padrao_tag_user, function ($match) use ($post) {
                $username = substr($match[0], 1); // Remove o "@" do início do username
            
                $user_controller = app(UserController::class);
                $user = $user_controller->getUserByUserName($username);
                if($user){

                    $img = auth()->user()->img_account;
                    $text = auth()->user()->name . " marcou você em um comentário";
                    $link1 = "/".auth()->user()->user_name;
                    $link2 = "https://pacoca.x10.mx/post/" . $post->id . "?modalComment=true";

                    if(auth()->user()->img_account){
                        $img = "https://pacoca.x10.mx/" . $user->img_account;
                    }else{
                        $img = 'https://pacoca.x10.mx/img/img-account.png';
                    }
    
                    $caractereParaRemover = "../";
                    $img_account = str_replace($caractereParaRemover, '', $img);

                    $this->setNotification($user->id, $img, $text, $link1, $link2);
                    $this->setNotificationEmail($user->email, $text, $text, $img_account, $link1, $link2);
                }
                
            }, $request->comment);

            if(isset($comment)){
                // NOTIFICAÇÃO
                $user_post = Post::where('id',$request->id_post)->get()->first();
                $user = User::where('id', $user_post->id_user)->first();

                $id_user = $user_post->id_user;

                if(auth()->user()->img_account){
                    $img = "https://pacoca.x10.mx/" . $user->img_account;
                }else{
                    $img = 'https://pacoca.x10.mx/img/img-account.png';
                }

                $text = auth()->user()->name . " comentou sua publicação";
                $link1 = "/" . auth()->user()->user_name;
                $link2 = "https://pacoca.x10.mx/post/" . $request->id_post;

                $caractereParaRemover = "../";
                $img_account = str_replace($caractereParaRemover, '', $img);

                
                if(auth()->user()->id != $user_post->id_user){
                    // $this->setNotification($user_post->id_user, $img, $text, $link1, $link2);
                    $this->setNotification($id_user, $img, $text, $link1, $link2);
    
                    return response()->json(
                        [
                            'message' => 'likeSuccess', 
                            'email_notification' => $user->email,
                            'subject' => 'Comentaram na sua publicação',
                            'text' =>   $text,
                            'link1' => $img_account,
                            'link2' =>  $link2,
                        ]
                    );
                }
                
                return response()->json(['message' => true]);
            }else{
                return response()->json(['message' => false]);
            }
        }else{
            return response()->json(['message' => false]);
        }
    }

    // CRIAR POST
    public function post(Request $request) {

        // $request->validate([
        //     'img' =>  'max:15000',
        //     'video' =>  'max:15000',
        // ]);

        // if ($request->fails()) {
        //     return redirect('/')
        //         ->withErrors($request)
        //         ->withInput();
        // }

        $validator = Validator::make($request->all(), [
            'img' => 'max:15000',
            'video' => 'max:15000',
        ]);
    
        if ($validator->fails()) {
            return redirect('/')
                ->withErrors($validator)
                ->withInput();
        }


        // Cria publicação
        $post = Post::create([
            'id_user' => auth()->user()->id,
            'text' => $request->text
        ]);
        
        $padrao_tag_user = '/(@[^\s]+)/';
        $texto_formatado = preg_replace_callback($padrao_tag_user, function ($match) use ($post) {
            $username = substr($match[0], 1); // Remove o "@" do início do username
        
            $user_controller = app(UserController::class);
            $user = $user_controller->getUserByUserName($username);
            if($user){
            
                $img = auth()->user()->img_account;
                $text = auth()->user()->name . " marcou você em uma publicação";
                $link1 = "/".auth()->user()->user_name;
                $link2 = "https://pacoca.x10.mx/post/" . $post->id;

                if(auth()->user()->img_account){
                    $img = "https://pacoca.x10.mx/" . $user->img_account;
                }else{
                    $img = 'https://pacoca.x10.mx/img/img-account.png';
                }

                $caractereParaRemover = "../";
                $img_account = str_replace($caractereParaRemover, '', $img);
            
                $this->setNotification($user->id, $img, $text, $link1, $link2);
                $this->setNotificationEmail($user->email, $text, $text, $img_account, $link1, $link2);
            }
        
        }, $request->text);

        
    
        // CASO TENHA IMAGEM NO POST
        if ($request->hasFile('img')) {
            if ($request->file('img')->isValid()) {
                $img = $request->img;
                $extension = $img->extension();
                $imgName = $post->id . ".png";
                $path = public_path('img/img_post');
    
                $request->img->move($path, $imgName);
    
                $img = ImagePost::create([
                    'id_post' => $post->id,
                    'path' => "../img/img_post/" . $imgName,
                    'type' => 0, // 0 = img - 1 = vídeo
                ]);
                echo $request->img;
            }
        }
    
        // CASO TENHA VÍDEO NO POST
        if ($request->hasFile('video')) {
            if ($request->file('video')->isValid()) {
                $videoFile = $request->video; // Use $videoFile instead of $video
                $extension = $videoFile->extension();
                $videoName = $post->id . ".mp4";
                $path = public_path('img/img_post');
    
                $request->video->move($path, $videoName);
    
                $video = ImagePost::create([
                    'id_post' => $post->id,
                    'path' => "../img/img_post/" . $videoName,
                    'type' => 1, // 0 = img - 1 = vídeo
                ]);
                echo $request->video;
            }
        }
        return redirect()->back()->with('error', 'Nenhum arquivo enviado.');
    }

    // APAGAR POST
    public function delete(Request $request){
        $post = Post::where('id', $request->id_post)->get()->first();
        $post_likes = PostLike::where('id_post', $request->id_post)->delete();//apaga likes do post
        $comments = Comment::where('id_post', $request->id_post)->delete();//apaga comentarios do post
        $images = ImagePost::where('id_post', $request->id_post)->delete();//apaga imagens do post

        $post->delete();
        return response()->json(['message' => 'delete']);
    }

    // APAGAR COMENTARIO
    public function delete_comment(Request $request){
        $comments = Comment::where('id', $request->id_comment)->delete();//apaga comentarios do post

        return response()->json(['message' => 'delete']);
    }

    // EDITAR POST
    public function edit(Request $request){
        $post = Post::where('id', $request->id_post)->update([
            'text' => $request->text_update
        ]);
        
        $padrao_tag_user = '/(@[^\s]+)/';
        $texto_formatado = preg_replace_callback($padrao_tag_user, function ($match) use ($request) {
            $username = substr($match[0], 1); // Remove o "@" do início do username
        
            $user_controller = app(UserController::class);
            $user = $user_controller->getUserByUserName($username);
            
            if ($user) {
                $img = auth()->user()->img_account;
                $text = auth()->user()->name . " marcou você em uma publicação";
                $link1 = "/".auth()->user()->user_name;
                $link2 = "/post/" . $request->id_post;
            
                $this->setNotification($user->id, $img, $text, $link1, $link2);
            
            } 
        }, $request->text_update);


        if($post){
            return response()->json(['message' => 'edit']);
        }else{
            return response()->json(['message' => 'erro']);
        }
    }

    // Verifica se usuário logado curtiu o post
    public function liked_post($post){
        if(auth()->user()){
            $like = PostLike::where('id_post', $post->id)->where('id_user', auth()->user()->id)->count();
        }else{
            $like = 0;
        }

        return $like;
        $like_count = Post::select('SELECT COUNT(*) as count FROM posts_likes WHERE id_post = ?', [$post->id]);
    }


    //total de curtidas de cada post
    public function like_count($post){
        $like_count = PostLike::where('id_post', $post->id)->count();

        // $like_count = Post::where()->get()->count();
        return $like_count;
    }

    //total de curtidas de cada post
    public function users_like($id_post){
        $users_like = User::join('posts_likes', 'users.id', '=', 'posts_likes.id_user')
            ->select('users.*')
            ->where('posts_likes.id_post', $id_post)
            ->get();

        // $like_count = Post::where()->get()->count();
        return $users_like;
    }

    //total de curtidas de cada post
    public function users_comment($post){
        $users_like = User::join('comments', 'users.id', '=', 'comments.id_user')
            ->select('users.*', 'comments.*')
            ->where('comments.id_post', $post->id)
            ->get();

        // $like_count = Post::where()->get()->count();
        return $users_like;
    }


    // tempo que o post foi publicado
    public function getDatePost($post){
        // $getDatePostagem = \Carbon\Carbon::parse($post->created_at);
        // $data_atual = \Carbon\Carbon::now();
        // $diferenca = $getDatePostagem->diff($data_atual);
        // $diferenca_anos = $getDatePostagem->diffInYears($data_atual);
        // $result = "";
        // $editado = ""; 

        // if($diferenca_anos >0){
        //     $result = "$anos anos";
        // }
        
        // else if($diferenca->days >0){
        //     $result = "$diferenca->days d";
        // }
        
        // else if($diferenca->h){
        //     $result = "$diferenca->h h";
        // }
        
        // else if($diferenca->i){
        //     $result = "$diferenca->i m";
        // }
        
        // else{
        //     $result = "Agora";
        // }
    

        $dataPostagem = strtotime($post->created_at);
        $dataAtual = time();
        $diferencaSegundos = $dataAtual - $dataPostagem;

        if ($diferencaSegundos < 60) {
            $tempo =  'há menos de um minuto';
        } elseif ($diferencaSegundos < 3600) {
            $minutos = floor($diferencaSegundos / 60);
            $tempo =  'há ' . $minutos . ' minuto(s)';
        } elseif ($diferencaSegundos < 86400) {
            $horas = floor($diferencaSegundos / 3600);
            $tempo =  'há ' . $horas . ' hora(s)';
        } elseif ($diferencaSegundos < 2592000) {
            $dias = floor($diferencaSegundos / 86400);
            if($dias == 1){
                $tempo =  'ontem';
            }else{
                $tempo =  'há ' . $dias . ' dia(s)';
            }
        } else {
            $tempo =  date('d/m/Y', $dataPostagem);
        }

        return $tempo;
    }
                                
    // Verifica se o post foi editado
    public function isPostEdit($post){
        if($post->created_at != $post->updated_at){
            $editado = "- editado";
        }else{
            $editado = "";
        }

        return $editado;
    }

    // Pega comentarios do post
    public function comments_post($post){
        $comments = Comment::where('id_post', $post->id)->get();
        return $comments;
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

    public function setNotificationEmail($email, $subject, $text, $img, $link1, $link2) {
        Mail::send('mail.notification',
        [
            'email' => $email,
            'subject' => $subject,
            'text' => $text,
            'link1' => $link1,
            'link2' => $link2
        ], 
        function ($m) use ($email, $subject, $img) {
            $m->from('pacoca150723@gmail.com', 'Paçoca');
            $m->to($email)->subject($subject);
        });
    }
}
