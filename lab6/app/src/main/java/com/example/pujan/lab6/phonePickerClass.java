package com.example.pujan.lab6;

/**
 * Created by pujan on 12/4/17.
 */

public class phonePickerClass {

    private String phoneName;
    private String phoneURL;
    private String phoneSpec;

    private void setPhoneInfo(Integer phoneBudget){
        switch (phoneBudget) {
            case 0: // 100-300
                phoneName = "ZTE Axon 7 Mini";
                phoneSpec = "$184.99";
                phoneURL = "https://www.amazon.com/ZTE-Axon-Mini-Unlocked-Platinum/dp/B01LY5VWJK?psc=1&SubscriptionId=AKIAINYWQL7SPW7D7JCA&tag=aboutcom02lifewire-20&linkCode=sp1&camp=2025&creative=165953&creativeASIN=B01LY5VWJK&ascsubtag=4045957%7Cgoogle.com%7C%7C%7C66%2C20%2C83%2C27%2C3%2C17%2C9%2C80%7C1%7C";
                break;
            case 1: // 300-600
                phoneName = "One Plus 5t";
                phoneSpec = "$499.99";
                phoneURL = "https://oneplus.net/oneplus-5t";
                break;
            case 2: //600-900
                phoneName = "Sasmsung Galaxy s8";
                phoneSpec = "$724.99";
                phoneURL = "https://www.bestbuy.com/site/samsung-galaxy-s8-64gb-unlocked-midnight-black/5803741.p?skuId=5803741";
                break;
            case 3: //900-1200
                phoneName = "iPhone X";
                phoneSpec = "$1149.99";
                phoneURL = "https://www.apple.com/shop/buy-iphone/iphone-x";
                break;
            default:
                phoneName = "none";
                phoneURL = "https://www.cnet.com/g00/topics/phones/best-phones/?i10c.encReferrer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8%3D";
                phoneSpec = "$";
        }
    }

    public void setPhoneName(Integer phoneBudget){

        setPhoneInfo(phoneBudget);
    }

    public void setPhoneURL(Integer phoneBudget){

        setPhoneInfo(phoneBudget);
    }

    public void setPhoneSpec(Integer phoneBudget){

        setPhoneInfo(phoneBudget);
    }

    public String getPhoneName(){

        return phoneName;
    }

    public String getPhoneURL(){

        return phoneURL;
    }

    public String getPhoneSpec(){

        return phoneSpec;
    }
}