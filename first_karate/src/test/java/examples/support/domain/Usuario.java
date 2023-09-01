package examples.support.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Usuario {

    private String firstname;
    private String lastname;
    private Double totalPrice;
    private DatasReservas datasReservas;
    private Adicional adicional;
}
