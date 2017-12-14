package com.example.pujan.project2;

import android.app.Dialog;
import android.content.DialogInterface;
import android.database.Cursor;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Objects;


public class MainActivity extends AppCompatActivity{

    private static final String tag = "MainActivity";
    DatabaseHelper myDatabaseHelper;
    private activityClass myActivityPicker = new activityClass();

    //variables
    ArrayList<TextView> datetimeArray = new ArrayList<>();
    ArrayList<String> activityArray = new ArrayList<>();
    String valueTime;
    String transfer1;
    String transfer2;
    Integer spinnerNumber;
    String myColor;
    Integer a1;
    String a2;
    String a22 = "Dec 11, 2017";
    Integer counter = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //onClick for Save Button
        final Button saveButton = findViewById(R.id.button);
        View.OnClickListener onclick = new View.OnClickListener() {
            public void onClick(View view) {
                saveData(view);
            }
        };

        //onClick for Reload Button
        final Button reloadButton = findViewById(R.id.reloadData);
        View.OnClickListener reloadClick = new View.OnClickListener(){
            public void onClick(View view){
                reloadData(view);
            }
        };

        saveButton.setOnClickListener(onclick);
        reloadButton.setOnClickListener(reloadClick);

        //Updating the Seekbar
        SeekBar seekBar = (SeekBar) findViewById(R.id.seekBar);
        final TextView seekBarValue = (TextView) findViewById(R.id.updateTimeBar);

        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean b) {
                seekBarValue.setText(String.valueOf(progress+15) + " minutes");
                valueTime = String.valueOf(progress+15) + " minutes";
            }
            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }
            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });

        //Changing the font of the Spinner
        Spinner categoryChooser = findViewById(R.id.spinner);
        String [] items = new String[5];
        items[0]="Category";
        items[1]="Endurance";
        items[2]="Strength";
        items[3]="Balance";
        items[4]="Flexibility";

        ArrayAdapter<String> spinnerAdapter = new ArrayAdapter<String>(this, R.layout.support_simple_spinner_dropdown_item, items) {

            public View getView(int position, View convertView, ViewGroup parent) {
                View v = super.getView(position, convertView, parent);

                Typeface type = Typeface.createFromAsset(getAssets(),"fonts/JosefinSans-Light.ttf");
                ((TextView) v).setTypeface(type);
                return v;
            }
            public View getDropDownView(int position,  View convertView,  ViewGroup parent) {
                View v =super.getDropDownView(position, convertView, parent);
                Typeface type = Typeface.createFromAsset(getAssets(),"fonts/JosefinSans-Light.ttf");
                ((TextView) v).setTypeface(type);
                return v;
            }
        };

        spinnerAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        categoryChooser.setAdapter(spinnerAdapter);
    }

    //Function to load the data into the listView
    private void populateListView() {
        ListView myListView = findViewById(R.id.myListView);
        Log.d(tag, "populateListView: Displaying data in ListView.");

        Cursor data = myDatabaseHelper.getData();
        final ArrayList<String> listData = new ArrayList<>();

        // Create an ArrayAdapter from List
        ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>
                (this, android.R.layout.simple_list_item_1, listData) {
            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                // Get the Item from ListView
                View view = super.getView(position, convertView, parent);

                // Initialize a TextView for ListView each Item
                TextView tv = view.findViewById(android.R.id.text1);

                // Set the text color of TextView (ListView Item)

//                for(int i=0; i<listData.size();i++){
//                    tv.setTextColor(Color.parseColor(activityArray.get(i)));
//                }
                tv.setTextColor(Color.parseColor("#2B303A"));
                Typeface type = Typeface.createFromAsset(getAssets(),"fonts/JosefinSans-Light.ttf");
                tv.setTypeface(type);
                // Generate ListView Item using TextView
                return view;
            }
        };

        a1 = listData.size();

        //iterating through the array to load the data
        while(data.moveToNext()){
            listData.add(0,data.getString(1));
        }
        myListView.setAdapter(arrayAdapter);

    }

    //reload Data function
    private void reloadData(View view) {
        myDatabaseHelper = new DatabaseHelper(this);
        chooseButton12(2);
    }

    //saving the data and pushing it to the feed
    public void saveData(View view){
        Spinner categoryChooser = findViewById(R.id.spinner);
        Integer categoryColor = categoryChooser.getSelectedItemPosition();
        spinnerNumber = categoryColor;
        myDatabaseHelper = new DatabaseHelper(this);
        myActivityPicker.setMyActivityCategory(categoryColor);
        String colorC = myActivityPicker.getMyColor();
        String nameC = myActivityPicker.getMyActivityCategory();
        myColor = colorC;

//        Date currentTime = Calendar.getInstance().getTime();
//        String currentDate = DateFormat.getDateInstance().format(new Date());
        String mydate = DateFormat.getDateTimeInstance().format(Calendar.getInstance().getTime());
        String onlyDate = " " + mydate.substring(0,12) + " ";
        String onlyTime = " " + mydate.substring(13,17) + " " + mydate.substring(21,mydate.length()) + " ";
        a2 = mydate.substring(0,12);

        EditText activityName = findViewById(R.id.activityDone);
        String nameValue = activityName.getText().toString();

        TextView dateAndTime = new TextView(this);
        TextView myActivity = new TextView(this);

        String myDateAndTime = onlyDate + " ~ " + onlyTime;
        transfer1 = myDateAndTime;
        String myActivityAndDuration = " " + nameC + " " + nameValue + " for " + valueTime;
        transfer2 = myActivityAndDuration;

//        dateAndTime.setText(onlyDate + "     " + nameValue + " for " + valueTime + " ");
//        dateAndTime.setLayoutParams(new LayoutParams(LayoutParams.WRAP_CONTENT,LayoutParams.WRAP_CONTENT));
//        dateAndTime.setTextSize(15);
//        dateAndTime.setBackgroundColor(Color.argb(250,100,200,100));

//        Integer colorHexVal = Integer.parseInt(colorC.replaceFirst("^#",""), 16);
//        dateAndTime.setTextColor(colorHexVal);
        dateAndTime.setTextColor(Color.parseColor(colorC));


//        Typeface myFont = Typeface.createFromAsset(getAssets(),"res/font/poiret_one.tff");
//        /* newActivity.setTypeface(myFont); */

        datetimeArray.add(dateAndTime);
        activityArray.add(colorC);
        chooseButton12(1);
        showImage();

    }

    public void chooseButton12(Integer value) {
        EditText activityName = findViewById(R.id.activityDone);
        if (value == 1) {
            if (activityName.length() != 0) {
                String cohesive = "\n"  + transfer1 + "\n" + transfer2 + "\n" ;
                AddData(cohesive);
                activityName.setText("");
                populateListView();
                if(Objects.equals(a22, a2)){
                    counter = counter + 1;
                    if(counter == 5){
                        AddData("Achievement Unlocked: Five Entries In A Single Day!");
                    }

                }
                else{
                    a22 = a2;
                }



                Log.d(tag, a22);
                Log.d(tag, a2);
                Log.d(tag, String.valueOf(counter));

            } else {
                toastMessage("You must put something in the text field!");
            }
        }
        else if (value == 2) {
            toastMessage("Data Reloaded");
            populateListView();
        }
    }

    public void AddData(String newEntry){
        boolean insertData = myDatabaseHelper.addData(newEntry);
//        if(insertData){
//            toastMessage("RIGHT");
//        } else{
//            toastMessage("WRONG");
//        }
    }

    public void showImage() {
        if(counter == 5){
        Dialog builder = new Dialog(this);
        builder.requestWindowFeature(Window.FEATURE_NO_TITLE);
        builder.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
        builder.setOnDismissListener(new DialogInterface.OnDismissListener() {
            @Override
            public void onDismiss(DialogInterface dialogInterface) {
            }
        });
        ImageView imageView = new ImageView(this);
        imageView.setImageResource(R.drawable.award);
        builder.addContentView(imageView, new RelativeLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        builder.show();
    }}

    private void toastMessage(String message){
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
    }
}
