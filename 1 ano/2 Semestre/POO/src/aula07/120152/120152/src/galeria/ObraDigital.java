package galeria;

public class ObraDigital extends Obra {
    private String blockchain;
    private String address;

    public ObraDigital(String name, String autor, float price, String blockchain, String address) {
        super(name, autor, price);
        this.blockchain = blockchain;
        this.address = address;
    }

    

    public String getBlockchain() {
        return blockchain;
    }

    public void setBlockchain(String blockchain) {
        this.blockchain = blockchain;
    }



    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }



    @Override
    public String toString() {
        return "ObraDigital : "+ super.toString() +", blockchain = " + blockchain + ", Endereço do contrato = " + address;
    }
}
