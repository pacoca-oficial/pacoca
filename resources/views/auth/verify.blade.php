{{-- @extends('layouts.main')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Verifique seu endereço de e-mail') }}</div>

                <div class="card-body">
                    @if (session('resent'))
                        <div class="alert alert-success" role="alert">
                            {{ __('Um novo link de verificação foi enviado para seu endereço de e-mail.') }}
                        </div>
                    @endif

                    {{ __('Antes de continuar, verifique se há um link de verificação em seu e-mail.') }}
                    {{ __('If you did not receive the email') }},
                    <form class="d-inline" method="POST" action="{{ route('verification.resend') }}">
                        @csrf
                        <button type="submit" class="btn btn-link p-0 m-0 align-baseline">{{ __('clique aqui para solicitar outro') }}</button>.
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection --}}

{{-- 
    "PRA QUE SERVE
    TANTO CÓDIGO
    SE A VIDA
    NÃO É PROGRAMADA
    E AS MELHORES COISAS
    NÃO TEM LÓGICA". 
    Algúem (algum ano)
--}}

@extends('layouts.main')
@section('title', 'Paçoca')

@section('content')
<div class="container-login">
    <div class="row row-login" style="height: 100%">
        <div class="col col-img-login">
          <img class="img-logo-login" src="../img/pacoca.png" height="400">
        </div>
        <div class="col col-form-login" style="font-size: 20px; margin-top: -30px">

            @if (session('resent'))
                <div style="margin: -70px 20px 40px 20px;" class="alert alert-success" role="alert">
                    {{ __('Um novo link de verificação foi enviado para seu endereço de e-mail. Olhe na caixa de Spam') }}
                </div>
            @endif
            <h2 class="titulo-login">Verificação de email</h2>

            {{ __('Antes de continuar, ') }}
            {{-- {{ __('Se você não recebeu o e-mail,') }} --}}
            <form class="d-inline" method="POST" action="{{ route('verification.resend') }}">
                @csrf
                <button type="submit" class="btn btn-link p-0 m-0 align-baseline">{{ __('clique aqui para enviar um email de verificação.') }}</button>.
            </form>
        </div>
    </div>
  </div>
@endsection


