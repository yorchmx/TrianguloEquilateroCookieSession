/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Memo
 */
public class Triangulo {
    private double altura;
    private double base;
    public void setAltura(double altura){
        this.altura = altura;
    }
    public void setBase(double base){
        this.base = base;
    }
    public double devolverPerimetro(){
        return base*3;
    }
    public double devolverArea(){
        return (base*altura)/2;
    }
}
