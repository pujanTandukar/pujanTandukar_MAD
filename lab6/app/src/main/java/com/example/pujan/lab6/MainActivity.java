package com.example.pujan.lab6;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {

    private phonePickerClass myPhonePicker = new phonePickerClass();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //get button
        final Button button = findViewById(R.id.button);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                findPhone(view);
            }
        };
        //add listener to the button
        button.setOnClickListener(onclick);
    }

    public void findPhone(View view){
        Spinner phoneSpinner = findViewById(R.id.spinner);
        Integer phoneSpinnerNumber = phoneSpinner.getSelectedItemPosition();
        myPhonePicker.setPhoneName(phoneSpinnerNumber);
        String suggestedPhoneName = myPhonePicker.getPhoneName();
        String suggestedPhoneURL = myPhonePicker.getPhoneURL();
        String suggestedPhoneSpec = myPhonePicker.getPhoneSpec();

        //create an Intent
        Intent intent = new Intent(this, Main2Activity.class);

        //pass data
        intent.putExtra("phoneName2", suggestedPhoneName);
        intent.putExtra("phoneURL2", suggestedPhoneURL);
        intent.putExtra("phoneSpec2", suggestedPhoneSpec);

        //start intent
        startActivity(intent);
    }
}
