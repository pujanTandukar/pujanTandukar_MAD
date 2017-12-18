package com.example.pujan.finalapp;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Button buildButton = findViewById(R.id.button);
        View.OnClickListener onclick = new View.OnClickListener() {
            public void onClick(View view) {
                buildBurrito(view);
            }
        };
        buildButton.setOnClickListener(onclick);

        final Button findButton = findViewById(R.id.button2);
        View.OnClickListener onclick2 = new View.OnClickListener() {
            public void onClick(View view) {
                findBurrito(view);
            }
        };
        findButton.setOnClickListener(onclick2);


    }

    String omgString;
    String omgURL;

    private void buildBurrito(View view) {
        EditText editText = findViewById(R.id.editText2);
        String burritoName = editText.getText().toString();

        ToggleButton toggle = findViewById(R.id.toggleButton);
        boolean meatOrVegie = toggle.isChecked();

        RadioGroup entreStyle = findViewById(R.id.radioGroup);
        int entreChoice = entreStyle.getCheckedRadioButtonId();

        CheckBox salsaChB = findViewById(R.id.salsaCB);
        Boolean ynSalsa = salsaChB.isChecked();

        CheckBox sourCreamChB = findViewById(R.id.sourCreamCB);
        Boolean ynSourCream = sourCreamChB.isChecked();

        CheckBox cheeseChB = findViewById(R.id.cheeseCB);
        Boolean ynCheese = cheeseChB.isChecked();

        CheckBox guacamoleChB = findViewById(R.id.guacamoleCB);
        Boolean ynGuacamole = guacamoleChB.isChecked();

        Spinner spinner = findViewById(R.id.spinner);
        String placeToEat = String.valueOf(spinner.getSelectedItem());

        Switch mySwitch = findViewById(R.id.switch1);
        Boolean mySwitchSetting = mySwitch.isChecked();

        ImageView myImage = findViewById(R.id.imageView);

        String myEntreeName = "";
        String myEntreeType = "";
        String yesSour ="";
        String yesGuac ="";
        String yesCheese ="";
        String yesSalsa ="";
        String withalso = "";
        String glutenFree ="";

        if (entreChoice == -1) {
            //toast
            Context context = getApplicationContext();
            CharSequence text = "Please select the type of entree";
            int duration = Toast.LENGTH_SHORT;

            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }

        else {

            if (entreChoice == R.id.pickBurrito) {
                myEntreeName = "Burrito";
                myImage.setImageResource(R.drawable.burrito);
            } else {
                myEntreeName = "Taco";
                myImage.setImageResource(R.drawable.taco);
            }
        }

        if(meatOrVegie) {
            myEntreeType = "meat";
        }else{
            myEntreeType = "veggies";
        }

        if(ynCheese || ynGuacamole || ynSalsa || ynSourCream){
            withalso = " with";
        }
        if(ynSourCream){
            yesSour = " sour cream";
        }

        if(ynGuacamole){
            yesGuac = " guacamole";
        }

        if(ynSalsa){
            yesSalsa = " salsa";
        }

        if(ynCheese){
            yesCheese = " cheese";
        }

        if(mySwitchSetting) {
            glutenFree = " (GF: Try it with a corn tortilla!)";
        }


        switch (placeToEat){
            case "The Hill":
                omgString = "Illegal Petes";
                omgURL = "http://illegalpetes.com/";
                break;
            case "29th Street":
                omgString = "Chipotle";
                omgURL= "https://www.chipotle.com/";
                break;
            case "Pearl Street":
                omgString = "Bartaco";
                omgURL = "https://bartaco.com/";
                break;
        }

        TextView displayMyEntree = findViewById(R.id.resultView);
        displayMyEntree.setText("The " + burritoName + " is a " + myEntreeName + " with " + myEntreeType + withalso + yesSalsa + yesSour + yesCheese + yesGuac
                + " you would like to eat on " + placeToEat + glutenFree);

    }

    private void findBurrito(View view) {

        //create an Intent
        Intent intent = new Intent(this, Main2Activity.class);

        //pass data
        intent.putExtra("bPlace", omgString);
        intent.putExtra("bURL", omgURL);

        //start intent
        startActivity(intent);
    }


}
