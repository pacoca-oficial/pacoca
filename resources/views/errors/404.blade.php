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
@section('title', 'Paçoca - Página não encontrada')

@include('layouts/menu')
@section('content')
    <div class="container container-404">
        <img src="{{asset('img/page-not-found.jpg')}}" class="img-page-not-found" srcset="">
    </div>

    
    {{-- MENU DE CELULAR --}}
    @include('layouts/menu_mobile')
@endsection
