/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package codigo;

import java.io.File;

/**
 *
 * @author ioch
 */
public class Principal {
    
    public static void main(String[] args) {
        
        //Main apunta a la ruta del archivo flex para ser generado
        String ruta = "C:/Users/Robert/Documents/AnalizadorJava/AnalizadorJava/src/codigo/Lexer.flex";
        
        generarLexer(ruta);
    }
    
    public static void generarLexer(String ruta){
        //se genera el archivo lexico con las reglas definidas en flex
        File archivo = new File(ruta);
        String [] argv = new String [] {archivo.getPath()};
        JFlex.Main.generate(archivo);
    }
   
}
