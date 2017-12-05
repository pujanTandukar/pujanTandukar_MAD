package com.example.pujan.lab6;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

public class Main2Activity extends AppCompatActivity {

    private String phoneName;
    private String phoneURL;
    private String phoneSpec;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        //get intent
        Intent intent = getIntent();
        phoneName = intent.getStringExtra("phoneName2");
        phoneURL = intent.getStringExtra("phoneURL2");
        phoneSpec = intent.getStringExtra("phoneSpec2");

        TextView messageView = findViewById(R.id.textView3);
        messageView.setText("You should check out " + phoneName);

        TextView message2View = findViewById(R.id.textView4);
        message2View.setText("Price: " + phoneSpec);

        //get image button
        final ImageButton imageButton = (ImageButton) findViewById(R.id.imageButton);
        switch(phoneSpec) {
            case "$184.99":
                imageButton.setImageResource(R.drawable.zte);
                break;
            case "$499.99":
                imageButton.setImageResource(R.drawable.fivet);
                break;
            case "$724.99":
                imageButton.setImageResource(R.drawable.galaxy);
                break;
            case "$1149.99":
                imageButton.setImageResource(R.drawable.ihpone);
                break;

        }

        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                loadWebSite(view);
            }
        };

        //add listener to the button
        imageButton.setOnClickListener(onclick);
    }

    public void loadWebSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(phoneURL));
        startActivity(intent);
    }
}
