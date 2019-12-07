@extends('layouts.app')
@section('title', 'Login')

@section('content')
    <div class="center">
        <h1>Login</h1>
        <br>

        <form action="{{route('login')}}" method="post">
            @csrf

            <div class="form-group">
                <input id="email" type="email"
                       class="form-control @error('email') is-invalid @enderror" name="email"
                       placeholder="email"
                       value="{{ old('email') }}" required autocomplete="email" autofocus>

                @error('email')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>

            <div class="form-group">
                <input id="password" type="password"
                       class="form-control @error('password') is-invalid @enderror" name="password"
                       placeholder="password"
                       required autocomplete="current-password">
            </div>

            <input type="submit" value="login" class="hidden">
        </form>
    </div>
@stop
