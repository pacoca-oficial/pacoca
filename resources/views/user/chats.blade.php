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
@section('title', 'Pesquisa')
@include('layouts/menu')

@section('content')
    <div class="row row-list-chat">
        {{-- TODAS AS CONVERSAS --}}
        <div class="col-3 col-list-chat">
            <div class="list-chat row">
                <div class="col-1" style="margin-right: 30px;display: flex; align-items: center">
                    <div class="img-list-chat" style="background-image: url('../img/img_account/1.png')!important"></div>
                </div>
                <div class="col" style="display: flex; align-items: center">
                    <h4>João</h4>
                </div>
            </div>

            <div class="list-chat row">
                <div class="col-1" style="margin-right: 30px;display: flex; align-items: center">
                    <div class="img-list-chat" style="background-image: url('../img/img_account/1.png')!important"></div>
                </div>
                <div class="col" style="display: flex; align-items: center">
                    <h4>João</h4>
                </div>
            </div>

            <div class="list-chat row">
                <div class="col-1" style="margin-right: 30px;display: flex; align-items: center">
                    <div class="img-list-chat" style="background-image: url('../img/img_account/1.png')!important"></div>
                </div>
                <div class="col" style="display: flex; align-items: center">
                    <h4>João</h4>
                </div>
            </div>

            <div class="list-chat row">
                <div class="col-1" style="margin-right: 30px;display: flex; align-items: center">
                    <div class="img-list-chat" style="background-image: url('../img/img_account/1.png')!important"></div>
                </div>
                <div class="col" style="display: flex; align-items: center">
                    <h4>João</h4>
                </div>
            </div>
        </div>

        {{-- Conversa --}}
        <div class="col">
            <div class="">
                <div class="list-chat row">
                    <div class="col-1" style="margin-right: 30px;display: flex; align-items: center">
                        <div class="img-list-chat" style="background-image: url('../img/img_account/1.png')!important"></div>
                    </div>
                    <div class="col" style="display: flex; align-items: center">
                        <h4>João</h4>
                    </div>
                </div>
            </div>

            <div class="chat">
                <div class="div-text-chat div-text-chat-logado">
                    <div class="text-user-logado">
                        asas
                    </div>
                </div>

                <div class="div-text-chat">
                    <div class="text-user-nao-logado">
                        asas x;dv jhbsd vusgfd uivgsdug fuyfdg ghfsd gjhf sdtf ysdfjhssdhgsdfyg
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{-- MENU DE CELULAR --}}
    @include('layouts/menu_mobile')
@endsection
