@extends('layouts.app')

@section('main-content')
    <div class="header">
        <nav>
            <ul>
                <li>
                    <a href="{{url('/')}}">
                        <i class="fas fa-home"></i>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-code"></i>
                        Projects
                    </a>
                </li>
                <li style="float:right">
                    <a href="{{route('logout')}}" class="logout">
                        <i class="fas fa-power-off"></i>
                    </a>
                </li>
                <li style="float: right">
                    <a href="#" class="">
                        <i class="far fa-bell"></i>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="subheader">
        <nav>
            <ul>
                <li>
                    <a href="#">
                        Project
                    </a>
                </li>
                <li>
                    <a href="#">
                        Board
                    </a>
                </li>
                <li style="float: right">
                    <a href="#">
                        <i class="fas fa-bars"></i>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="main">
        @yield('content')
    </div>
@stop
