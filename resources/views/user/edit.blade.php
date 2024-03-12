{{-- 
    "PRA QUE SERVE
    TANTO CÓDIGO
    SE A VIDA
    NÃO É PROGRAMADA
    E AS MELHORES COISAS
    NÃO TEM LÓGICA". 
    Algúem (algum ano)
--}}
@php
    $user_controller = app(App\Http\Controllers\UserController::class);
    $post_controller = app(App\Http\Controllers\PostsController::class);
@endphp
@extends('layouts.main')
@php
    $user = auth()->user();

@endphp
@section('title', 'Paçoca - Editar Conta')

@include('layouts/menu') {{-- Adiciona menu --}}

{{-- Conteudo --}}
@section('content')
    <meta name="csrf-token" content="{{ csrf_token() }}">{{-- TOKEN PARA O CURTIR FUNCIONAR --}}

    {{-- Informações da conta --}}
    <div class="container container-account" style="padding-bottom: 100px">
        {{-- Mudar imagem da conta --}}
        {{-- o  enctype="multipart/form-data" serve para salvar arquivos --}}
        <form class="col" action="/edit-image-account" method="post" enctype="multipart/form-data">
            @csrf

                <div class="container" style="display:flex; justify-content: center;">
                    <div class="row">
                        <div class="col">
                            {{-- Imagem da conta --}}
                            @if($user->img_account)
                                <label for="img" class="label-img img-edit  @error('img') img-error @enderror" style="background-image: url('{{$user->img_account}}')">
                                    <img src="../img/photo.png" width="50%">
                                </label>
                                {{-- <img src="{{$user->img_account}}" class="img-conta" srcset=""> --}}
                            @else
                                <label for="img" class="label-img img-edit  @error('img') img-error @enderror" style="background-image: url('../img/img-account.png')">
                                    <img src="../img/photo.png"  width="50%">
                                </label>
                                {{-- <img src="../img/img-account.png" class="img-conta" srcset=""> --}}
                            @endif
                        </div>
                    </div>
            </div>

            <div class="col">
                <input type="file" class="d-none @error('img') is-invalid @enderror" name="img" id="img">
                
                    @error('img')
                        <span class="invalid-feedback" role="alert" style="text-align: center">
                            {{-- <strong>{{ $message }}</strong> --}}
                            <strong> Selecione uma imagem acima </strong>
                        </span>
                    @enderror
            </div>
            <div class="col" style="display:flex; justify-content: center;">
                <button class="btn btn-login" type="submit" style="width: 150px; margin-top: 5px">Salvar</button>
            </div>
        </form>
        
        <div class="row" style="margin-top: -15px">
            <div class="col-8 col-name-user-edit">

                <form class="row" action="/edit" method="post">
                    @csrf
                    {{-- ID do usuario --}}
                        <input id="id_user" type="hidden" class="form-control" name="id_user" value="{{ $user->id }}" autocomplete="off" autofocus>

                    {{-- Nome --}}
                    <div class="col-md-6">
                        <label for="name" class="col-md-4 label-register text-md-right">{{ __('Nome') }}</label>

                        <div class="col">
                            <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ $user->name }}" autocomplete="name" autofocus>

                            @error('name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    {{-- Nome de usuário --}}
                    <div class="col-md-6">
                        <label for="user_name" class="col-md-4 label-register text-md-right">{{ __('Nome de usuário') }}</label>

                        <div class="col">
                            <input id="user_name" type="text" class="form-control @error('user_name') is-invalid @enderror" name="user_name" value="{{ $user->user_name }}" autocomplete="off">

                            @error('user_name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    {{-- Email --}}
                    <div class="col-md-6">
                        <label for="email" class="col-md-4 label-register text-md-right">{{ __('Email') }}</label>

                        <div class="col">
                            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ $user->email }}" autocomplete="email">

                            @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    {{-- Telefone --}}
                    <div class="col-md-6">
                        <label for="phone" class="col-md-4 label-register text-md-right">{{ __('Telefone') }}</label>

                        <div class="col">
                            <input id="phone" type="text" class="form-control @error('phone') is-invalid @enderror" name="phone" value="{{ $user->phone }}" autocomplete="tel">

                            @error('phone')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    {{-- Senha --}}
                    <div class="col-md-6">
                        <label for="password" class="col-md-4 label-register text-md-right">{{ __('Senha') }}</label>

                        <div class="col">
                            <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" autocomplete="current-password">

                            @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    {{-- Confirmar Senha --}}
                    <div class="col-md-6">
                        <label for="password-confirm" class="col-md-4 label-register text-md-right @error('password_confirmation') is-invalid @enderror">{{ __('Confirmar Senha') }}</label>

                        <div class="col">
                            <input id="password-confirm" type="password" class="form-control" name="password_confirmation" autocomplete="new-password">

                            @error('password_confirmation')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    {{-- Site --}}
                    <div class="col-md-6">
                        <label for="site" class="col-md-4 label-register text-md-right">{{ __('Site') }}</label>

                        <div class="col">
                            <input id="site" type="link" class="form-control @error('site') is-invalid @enderror" name="site" value="{{ $user->site }}">

                            @error('site')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    {{-- Biografia --}}
                    <div class="col-md-6">
                        <label for="biography" class="col-md-4 label-register text-md-right">{{ __('Biografia') }}</label>

                        <div class="col">
                            <input id="biography" type="text" class="form-control @error('biography') is-invalid @enderror" name="biography" value="{{ $user->biography }}">

                            @error('biography')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    {{-- Sexo --}}
                    <div class="col-md-6">
                        <label for="sexo" class="col-md-4 label-register text-md-right">{{ __('Sexo') }}</label>

                        <div class="col">
                            <input id="sexo" type="text" class="form-control @error('sexo') is-invalid @enderror" name="sexo" value="{{ $user->sexo }}" autocomplete="off">

                            @error('sexo')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    {{-- Data de Nascimento --}}
                    <div class="col-md-6 mb-5">
                        <label for="birth_date" class="col-md-4 label-register text-md-right">{{ __('Data de nascimento') }}</label>

                        <div class="col">
                            <input id="birth_date" type="date" class="form-control @error('birth_date') is-invalid @enderror" name="birth_date" value="{{ $user->birth_date }}">

                            @error('birth_date')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>
    
                    {{-- Criar Conta --}}
                    <div class="form-group">
                        <div class="col link-criar-conta">
                            <button type="submit" class="btn btn-login">
                                {{ __('Atualizar Conta') }}
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    {{-- MENU DE CELULAR --}}
    @include('layouts/menu_mobile')
@endsection
