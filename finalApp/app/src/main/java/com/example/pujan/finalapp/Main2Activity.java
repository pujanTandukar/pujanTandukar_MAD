package com.example.pujan.finalapp;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

public class Main2Activity extends AppCompatActivity {

    private String burritoPlace;
    private String burritoURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        //get intent
        Intent intent = getIntent();
        burritoPlace = intent.getStringExtra("bPlace");
        burritoURL = intent.getStringExtra("bURL");

        TextView messageView = (TextView) findViewById(R.id.checkPlaceBox);
        messageView.setText("You should check out " + burritoPlace);

        final ImageButton imageButton = findViewById(R.id.imageButton);
        View.OnClickListener onclick23 = new View.OnClickListener(){
            public void onClick(View view){
                loadWebSite(view);
            }
        };
        imageButton.setOnClickListener(onclick23);
    }

        public void loadWebSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(burritoURL));
        startActivity(intent);
        }
}



