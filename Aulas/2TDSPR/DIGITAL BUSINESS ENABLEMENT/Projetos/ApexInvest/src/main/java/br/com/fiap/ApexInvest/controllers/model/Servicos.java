package br.com.fiap.ApexInvest.controllers.model;

public class Servicos {
    private String agencia;
    private String conta;
    private String nome;
    private String renda;
    public Servicos() {
    }
    public Servicos(String agencia, String conta, String nome, String renda) {
        this.agencia = agencia;
        this.conta = conta;
        this.nome = nome;
        this.renda = renda;
    }
    public String getAgencia() {
        return agencia;
    }
    public void setAgencia(String agencia) {
        this.agencia = agencia;
    }
    public String getConta() {
        return conta;
    }
    public void setConta(String conta) {
        this.conta = conta;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getRenda() {
        return renda;
    }
    public void setRenda(String renda) {
        this.renda = renda;
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((agencia == null) ? 0 : agencia.hashCode());
        result = prime * result + ((conta == null) ? 0 : conta.hashCode());
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        result = prime * result + ((renda == null) ? 0 : renda.hashCode());
        return result;
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Servicos other = (Servicos) obj;
        if (agencia == null) {
            if (other.agencia != null)
                return false;
        } else if (!agencia.equals(other.agencia))
            return false;
        if (conta == null) {
            if (other.conta != null)
                return false;
        } else if (!conta.equals(other.conta))
            return false;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        if (renda == null) {
            if (other.renda != null)
                return false;
        } else if (!renda.equals(other.renda))
            return false;
        return true;
    }
    @Override
    public String toString() {
        return "Servicos [agencia=" + agencia + ", conta=" + conta + ", nome=" + nome + ", renda=" + renda + "]";
    }

    
    

}
