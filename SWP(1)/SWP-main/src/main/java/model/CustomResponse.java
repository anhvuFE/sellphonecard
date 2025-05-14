package model;

import java.util.List;
import model.Card;
import model.Product;

@lombok.Getter
@lombok.Setter
public class CustomResponse {
    private List<Card> listCard;
    private Product product;

}
