package com.example.exam_project;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ListActivity extends AppCompatActivity {

    EditText writeElement;
    Button buttonAdd;
    Button buttonDelete;
    Button buttonDeleteAll;
    ListView listView;

    String[] ListElements = new String[] {
    };
    ArrayList arrayList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_list);

        writeElement = (EditText) findViewById(R.id.addElement);
        buttonAdd = (Button) findViewById(R.id.addToList);
        buttonDelete = (Button) findViewById(R.id.deleteFromList);
        buttonDeleteAll = (Button) findViewById(R.id.deleteAllFromList);
        listView = (ListView) findViewById(R.id.listview);

        arrayList = new ArrayList();
        final List<String> arrayList = new ArrayList<String>(Arrays.asList(ListElements));
        final ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(ListActivity.this
                , R.layout.support_simple_spinner_dropdown_item, arrayList);

        listView.setAdapter(arrayAdapter);

        buttonAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //if ( writeElement.getText().length() != 0 ) {
                if ( !writeElement.getText().toString().isEmpty() ) {
                    arrayList.add(writeElement.getText().toString());
                    arrayAdapter.notifyDataSetChanged();
                    writeElement.getText().clear();
                }
            }
        });

        buttonDeleteAll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (arrayList.size() > 0) {
                    arrayList.clear();
                    arrayAdapter.notifyDataSetChanged();
                    listView.setAdapter(arrayAdapter);
                    Toast.makeText(ListActivity.this, "All elements deleted.", Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(ListActivity.this, "No elements to delete .", Toast.LENGTH_LONG).show();
                }
            }
        });

        // click on item in list to delete only one -> funktioniert!
        listView.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                if(arrayList.size()>0) {
                    //String item = arrayList.get(position);
                    String item = arrayAdapter.getItem(position);
                    arrayList.remove(position);
                    arrayAdapter.notifyDataSetChanged();
                    listView.setAdapter(arrayAdapter);
                    Toast.makeText(ListActivity.this, "Element deleted.", Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(ListActivity.this, "No element to delete.", Toast.LENGTH_LONG).show();
                }
            }
        });

        // delete first element of the list
        buttonDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Toast.makeText(ListActivity.this, "To delete one element, click on the item in the list.", Toast.LENGTH_LONG).show();
                if (arrayList.size() > 0) {
                    arrayList.remove(0);
                    arrayAdapter.notifyDataSetChanged();
                    listView.setAdapter(arrayAdapter);
                    Toast.makeText(ListActivity.this, "Element deleted.", Toast.LENGTH_LONG).show();
                    //Toast.makeText(ListActivity.this, "No selected item to delete. Hold down long the element.", Toast.LENGTH_LONG).show();
                } else {
                    //Toast.makeText(ListActivity.this, "No elements to delete all.", Toast.LENGTH_LONG).show();
                    Toast.makeText(ListActivity.this, "No element to delete.", Toast.LENGTH_LONG).show();
                }
            }
        });

//        // function: first mark an item from the list and then click 'delete item'-button
//        listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
//            //listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
//            @Override
//            public boolean onItemLongClick(AdapterView<?> parent, View view, final int position, long id) {
//                //public void onItemClick(AdapterView<?> parent, View view, final int position, long id) {
//
//                buttonDelete.setOnClickListener(new View.OnClickListener() {
//                    @Override
//                    public void onClick(View v) {
//                        if (arrayList.size() > 0) {
//                            arrayList.remove(position);
//                            arrayAdapter.notifyDataSetChanged();
//                            listView.setAdapter(arrayAdapter);
//                            Toast.makeText(ListActivity.this, "Element deleted.", Toast.LENGTH_LONG).show();
//                        } else {
//                            Toast.makeText(ListActivity.this, "No element to delete.", Toast.LENGTH_LONG).show();
//                        }
//                    }
//                });
//                return true;
//            }
//        });
    }

    @Override
    protected void onPause(){
        super.onPause();
        //listView = (ListView) findViewById(R.id.listview);
    }

    @Override
    protected void onResume(){
        super.onResume();
        //listView = (ListView) findViewById(R.id.listview);
    }

    @Override
    protected void onDestroy(){
        super.onDestroy();
    }
}
