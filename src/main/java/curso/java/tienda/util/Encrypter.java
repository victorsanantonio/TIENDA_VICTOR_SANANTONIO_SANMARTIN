package curso.java.tienda.util;

import org.apache.tomcat.util.codec.binary.Base64;

public class Encrypter {
	
	public String encryptedPassword(String password) {
		Base64 base64 = new Base64();
		//ENCRIPTAR
		String encriptada = new String(base64.encode(password.getBytes()));
		return encriptada;
		
	}
	
	public String desencryptedPassword(String userPassword) {
		Base64 base64 = new Base64();
		String desencriptado = new String(base64.decode(userPassword.getBytes()));
        return desencriptado;
	}
}
