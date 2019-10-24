package com.example.exam_project;

//import android.annotation.SuppressLint;
import android.app.DatePickerDialog;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Toast;

import java.util.Calendar;

public class FormularActivity extends AppCompatActivity {

    Calendar calendar;
    EditText birthday;
    int year, month, day;
    Button buttonSaveBack;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_formular);

        //getting calendar instance
        calendar = Calendar.getInstance();
        year = calendar.get(Calendar.YEAR);
        month = calendar.get(Calendar.MONTH);
        day = calendar.get(Calendar.DAY_OF_MONTH);

        birthday = (EditText)findViewById(R.id.editText7);
        buttonSaveBack = (Button)findViewById(R.id.buttonSaveBack);

        birthday.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DatePickerDialog datePickerDialog = new DatePickerDialog(
                        FormularActivity.this, new DatePickerDialog.OnDateSetListener() {

                    //@SuppressLint("SetTextI18n")
                    @Override
                    public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
                        //sets date in EditText
                        birthday.setText(dayOfMonth+"."+ (month+1) +"."+year);
                    }

                }, year, month, day);
                //shows the calendar dialog
                datePickerDialog.show();

            }
        });

        buttonSaveBack.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                Toast.makeText(FormularActivity.this, "Kein Profil vorhanden.", Toast.LENGTH_SHORT).show();
                //finish();
            }

        });
    }
}
