package br.com.fiap.domain.entity;


import jakarta.persistence.*;

@Entity
@Table(name = "TB_DEPOSITO")
public class Deposito {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_DEPOSITO")
    @SequenceGenerator(name = "SQ_DEPOSITO", sequenceName = "SQ_DEPOSITO",allocationSize = 1, initialValue = 1)


    private Long id;
    @Column(name = "NM_DEPOSITO")
    private String nome;


    public Deposito(Long id) {
        this.setId(id);
    }

    public Deposito(Long id, String nome) {
        this.setId(id);
        this.setNome(nome);
    }

    @Override
    public String toString() {
        return "Deposito{" +
                "id=" + getId() +
                ", nome='" + getNome() + '\'' +
                '}';
    }

    public Long getId() {
        return id;
    }

    public Deposito setId(Long id) {
        this.id = id;
        return this;
    }

    public String getNome() {
        return nome;
    }

    public Deposito setNome(String nome) {
        this.nome = nome;
        return this;
    }
}
