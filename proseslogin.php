<?php
session_start();
require_once ('koneksi.php');


$user = $_POST['username'];
$pass     =md5($_POST['password']);
$cekuser = mysqli_query($konek,"SELECT * FROM pengguna WHERE username = '$user'");
$jumlah = mysqli_num_rows($cekuser);
$hasil = mysqli_fetch_array($cekuser);
if ( $jumlah == 0 ) {
header('location:login.php?userfail');
} else {
    if ( $pass <> $hasil['password'] ) {
header('location:login.php?passwordfail');
    } else {
        $_SESSION['username'] = $user;
        $_SESSION['level'] = $hasil['level'];
        header('location:index.php');
    }
}
?>