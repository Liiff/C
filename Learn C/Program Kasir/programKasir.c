#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

struct daftarHarga{
    int id;
    char nama[25];
    int harga;
};

struct barang{
    int id;
    int qty;
    int subTotal;
};

struct daftarHarga menu[5] = {
        {1, "Ayam Goreng + Nasi", 17000},
        {2, "Lele Goreng + Nasi", 20000},
        {3, "Lalapan Jumbo", 25000},
        {4, "Es Teh", 5000},
        {5, "Lemon Tea", 7000}
    };

int hitungSubTotal(int x, int y){  // Fungsi menghitung Total Bayar
    int totalHarga;

    for (int i = 1; i <= x; i++){
        if(i == x)
            totalHarga = menu[i-1].harga * y;
    }

    return totalHarga;
}

int main(){

    struct barang Keranjang[10];
    int totalHarga = 0;
    int pilihan = 0;
    char ulang;

    do{
        puts("## DAFTAR MENU ##");
        
        for(int i = 0; i < 5; i++){
            printf("%d. %-20s Rp %d\n", menu[i].id, menu[i].nama, menu[i].harga);
        }
        
        printf("Masukkan pilihan anda     : "); scanf("%d", &Keranjang[pilihan].id);
        printf("Masukkan jumlah pembelian : "); scanf("%d", &Keranjang[pilihan].qty);
        
        Keranjang[pilihan].subTotal = hitungSubTotal(Keranjang[pilihan].id, Keranjang[pilihan].qty);
        if (pilihan < 10)
            pilihan++;

        else{
            printf("Max pesanan hanya 10x\n");
            break;
        }

        printf("Apakah ada barang yang ingin ditambah? (y/t): "); scanf(" %c", &ulang);
        ulang = toupper(ulang);

    } while (ulang == 'Y');

    for (int i = 0; i < pilihan; i++){
        totalHarga += Keranjang[i].subTotal;
    };

    printf("Total harga = %d", totalHarga);

}
