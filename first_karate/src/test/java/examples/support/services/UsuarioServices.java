package examples.support.services;

import com.google.gson.Gson;
import examples.support.domain.Adicional;
import examples.support.domain.DatasReservas;
import examples.support.domain.Usuario;

public class UsuarioServices {
    private static Usuario gerarUsuario() {
        return Usuario.builder()
                .firstname("Will")
                .lastname("Smith")
                .totalPrice(15.00)
                .datasReservas(DatasReservas.builder()
                        .checkin("12.05.2020")
                        .checkout("12.06.2020")
                        .build()).adicional(Adicional.builder()
                        .additionalneeds("Café da manhã")
                        .build())
                .build();
    }

    public String toJson() {
        var usuario = gerarUsuario();
        Gson gson = new Gson();
        return gson.toJson(usuario);
    }

    public static void main(String[] args) {
        Gson gson = new Gson();
        gson.toJson(gerarUsuario());

        System.out.println(gson);
    }
}
