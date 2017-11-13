package com.example.pujan.lab5;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void showTvShow(View view) {

        TextView tvShowTitle = findViewById(R.id.textView);
        ImageView tvShowImage = findViewById(R.id.imageView);
        Spinner tvShowGenre = findViewById(R.id.spinner);
        ToggleButton tvShowDuration = findViewById(R.id.toggleButton2);
        boolean toggleDuration = tvShowDuration.isChecked();
        String tvGenre = String.valueOf(tvShowGenre.getSelectedItem());
        RatingBar tvRatingbar  = findViewById(R.id.ratingBar);

        String tvShow = "";

        switch(tvGenre) {

            case "Choose a genre!":
                Context context = getApplicationContext();
                CharSequence text = "Please choose a genre!";
                int duration = Toast.LENGTH_SHORT;

                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
                break;

            case "Science Fiction":
                if (!toggleDuration) {
                    tvShow = "Stranger Things";
                    tvShowImage.setImageResource(R.drawable.stranger);
                    tvRatingbar.setRating((float) 2.7);
                }
                else{
                    tvShow = "Rick and Morty";
                    tvShowImage.setImageResource(R.drawable.rick);
                    tvRatingbar.setRating((float) 2.9);
                }
                break;

            case "Fantasy":
                if (!toggleDuration) {
                    tvShow = "Game of Thrones";
                    tvShowImage.setImageResource(R.drawable.thrones);
                    tvRatingbar.setRating((float) 2.85);
                }
                else{
                    tvShow = "Sabrina";
                    tvShowImage.setImageResource(R.drawable.sabrina);
                    tvRatingbar.setRating((float) 2.0);
                }
                break;

            case "Super Heroes":
                if (!toggleDuration) {
                    tvShow = "The Flash";
                    tvShowImage.setImageResource(R.drawable.flash);
                    tvRatingbar.setRating((float) 2.8);
                }
                else {
                    tvShow = "Power Rangers";
                    ;
                    tvShowImage.setImageResource(R.drawable.power);
                    tvRatingbar.setRating((float) 2.0);
                }
                break;

            case "Romance":
                if (!toggleDuration) {
                    tvShow = "Grey's Anatomy";
                    tvShowImage.setImageResource(R.drawable.greys);
                    tvRatingbar.setRating((float) 2.6);
                }
                else{
                    tvShow = "How I Met Your Mother";;
                    tvShowImage.setImageResource(R.drawable.himym);
                    tvRatingbar.setRating((float) 2.8);
                }
                break;

        }
        tvShowTitle.setText(tvShow);
    }
}
