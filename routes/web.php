<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\View;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', function () {
    return view('auth.login');
});

/*
Route::middleware(['auth:sanctum', 'verified'])->get('/dash', function () {
    return view('dash.index');
})->name('dash');

*/

Route::get('/dash','App\Http\Controllers\DashboardController@index');
Route::get('/dash/crud',function(){
    return view('crud.index');
});

Route::get('/dash/crud/create',function(){
    return view('crud.create');
});

/*


if (View::exists('vista2')) {
    Route::get('/', function () {
    return view('vista1',['nombre'=>'Dany']);
});
} else {
    Route::get('/', function () {
        return 'View requested doesnt exists';
    });
}


Route::get('/','App\Http\Controllers\InicioController@index');




Route::get('texto', function(){
    return "hi";
});


Route::get('array',function(){
    $numbers = ["1","2","3"];
    return $numbers;
});


//Pasar parametros a una ruta
//el parametro se pasa entre llave {}
Route::get('/nombre/{nombre}/apellido/{apellido}',function($nombre,$apellido){

return "<h1>El nombre es:______" .$nombre."</h1> <br><h1>El apellido es:______" .$apellido."</h1>";

});

//parametros por defecto
//  para pasar parametro por defecto escribir ? antes de cerrar el parametro
Route::get('/cliente/{cliente?}',function($cliente="General"){

return "<h1>El nombre es:______".$cliente."</h1>";
});


//Redirect Route

Route::get('/ruta1', function(){
    return "<h1>Esta es la ruta 1</h1>";
})->name("rutaN1");


Route::get('/ruta2', function(){
    return redirect()->route("rutaN1");
});


//just numbers or characteres
Route::get('/usuario/{usuario}',function($usuario){

    return "<h1>El usuari es:______".$usuario."</h1>";
})->where('usuario','[a-z]+');
*/
