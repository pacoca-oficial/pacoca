<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ChatController extends Controller
{
    public function opeChats($user_name){
        return view('user.chats', ['user_name' => $user_name]);
    }
}
