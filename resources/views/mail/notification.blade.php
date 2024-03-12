@extends('layouts.main')
@section('title', 'Read Book')

@section('content')

    <div style="font-family: sans-serif; display: flex; flex-wrap: wrap; margin: 0!important; cursor: pointer;" onclick="window.location.href = '{{$link2}}'">
        <div class="col-3">
            <img src="{{ $link1 }}" style="height: 200px;" class="img">
        </div>
        <div class="col">
            <h1>{{$subject}}</h1>
            <p style="font-size: 20px;">{{$text}}</p>
            <a href="{{$link2}}" onclick="window.location.href = '{{$link2}}'" style="background: #5bb4ff!important; color: #fff!important; border: 0!important; padding: 10px 20px; border-radius: 15px" class="btn">Visualizar</a>
        </div>
    </div>
    
@endsection
