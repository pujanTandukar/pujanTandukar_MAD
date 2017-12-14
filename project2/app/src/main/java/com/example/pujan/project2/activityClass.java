package com.example.pujan.project2;

/**
 * Created by pujan on 12/13/17.
 */

public class activityClass {
    private String myActivityName;
    private String myColor;
    private String myActivityCategory;

    private void setActivityInfo(Integer categoryColor) {
        switch(categoryColor){
            case 1:
                myColor = "#ff0000";
                myActivityCategory = "[E]";
                break;
            case 2:
                myColor = "#00ff00";
                myActivityCategory = "[S]";
                break;
            case 3:
                myColor = "#0000ff";
                myActivityCategory = "[B]";
                break;
            case 4:
                myColor = "#00fafa";
                myActivityCategory = "[F]";
                break;
            default:
                myColor = "#000000";
                myActivityCategory = "[C]";
                break;
        }
    }

    public void setMyActivityName(Integer categoryColor){

        setActivityInfo(categoryColor);
    }

    public void setMyColor(Integer categoryColor){

        setActivityInfo(categoryColor);
    }

    public void setMyActivityCategory(Integer categoryColor){

        setActivityInfo(categoryColor);
    }

    public String getMyActivityName(){

        return myActivityName;
    }

    public String getMyColor(){

        return myColor;
    }

    public String getMyActivityCategory(){

        return myActivityCategory;
    }
}

