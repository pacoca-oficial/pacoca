<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => 'João',
            'user_name' => 'joao',
            'email' => 'joao@gmail.com',
            'password' =>  bcrypt('12345678'),
            'phone' => '11 929378856',
            'biography' => 'Estudo DS',
            'sexo' => 'Masculino',
            'img_account' => '../img/img_account/1.png',
            'birth_date' => '2005-08-13',
        ]);
    }
}
