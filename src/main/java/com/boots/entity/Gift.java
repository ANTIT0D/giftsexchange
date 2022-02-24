package com.boots.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "t_gift")
public class Gift {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String giftName;
    private String giftNote;
    private String giftPrice;

    public Gift() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGiftName() {
        return giftName;
    }

    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }

    public String getGiftNote() {
        return giftNote;
    }

    public void setGiftNote(String giftNote) {
        this.giftNote = giftNote;
    }

    public String getGiftPrice() {
        return giftPrice;
    }

    public void setGiftPrice(String giftPrice) {
        this.giftPrice = giftPrice;
    }
}
