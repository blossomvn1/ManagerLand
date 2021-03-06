﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ManageStore.DAO
{
    public class DataProvider
    {
        private static DataProvider instance;
        //Qua bên fSwitchCase sửa nha mọi người. Nếu sửa thì comment cái code lại rồi làm cái code mới cho mình để người sau khỏi mắc công lấy connection string.
        private static string connectionSTR = "";// = @"Data Source=DESKTOP-4ATVFV8\MSSQLSERVER01;Initial Catalog=QLNHADAT_TEST;Integrated Security=True";
        
        public static DataProvider Instance { 
            get { if (instance == null) instance = new DataProvider();return DataProvider.instance; }
            private set { DataProvider.instance = value; }
        }

        public static string ConnectionSTR { get => connectionSTR; set => connectionSTR = value; }//ctrl + R + E

        public DataTable ExecuteQuery(string query, object[] parameter =null) //Truy van du lieu tu data base
        {
            DataTable data = new DataTable();

            using (SqlConnection connection = new SqlConnection(ConnectionSTR)) //Ket noi nen de trong try catch
            {

                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);
                if(parameter!=null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach(string item in listPara)
                    {
                        if(item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }
                

                SqlDataAdapter adapter = new SqlDataAdapter(command);

                adapter.Fill(data);

                connection.Close();
                
            }

            return data;
        }

        public int ExecuteNonQuery(string query, object[] parameter = null) //Tra ve so dong update, delete thanh cong.
        {
            int data = 0;

            using (SqlConnection connection = new SqlConnection(ConnectionSTR))
            {


                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);
                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }
                data = command.ExecuteNonQuery();

                connection.Close();

            }

            return data;
        }

        public object ExecuteScalar(string query, object[] parameter = null)
        {
            object data = 0;

            using (SqlConnection connection = new SqlConnection(ConnectionSTR))
            {


                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);
                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }
                data = command.ExecuteScalar();

                connection.Close();

            }

            return data;
        }

        //======================================================================
        //Ham xu ly exec co dau phay
        public DataTable ExecuteParameterQuery(string query, object[] parameter = null) //Truy van du lieu tu data base, khong can chu y dau ',' hay @, hay khoang trang
        {
            DataTable data = new DataTable();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionSTR))
                {

                    connection.Open();

                    SqlCommand command = new SqlCommand(query, connection);
                    if (parameter != null)
                    {
                        string[] listPara = query.Split(' ', ',');
                        int i = 0;
                        foreach (string item in listPara)
                        {
                            if (item.Contains('@'))
                            {
                                command.Parameters.AddWithValue(item, parameter[i]);
                                i++;
                            }
                        }
                    }


                    SqlDataAdapter adapter = new SqlDataAdapter(command);

                    adapter.Fill(data);

                    connection.Close();

                }
            }
            catch(Exception error)
            {
                MessageBox.Show(error.Message); //Them using System.Windows.Forms;
            }

            return data;
        }

        public int ExecuteParameterNonQuery(string query, object[] parameter = null) //Truy van du lieu tu data base, khong can chu y dau ',' hay @, hay khoang trang
        {
            int data = 0;
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionSTR))
                {

                    connection.Open();

                    SqlCommand command = new SqlCommand(query, connection);
                    if (parameter != null)
                    {
                        string[] listPara = query.Split(' ', ',');
                        int i = 0;
                        foreach (string item in listPara)
                        {
                            if (item.Contains('@'))
                            {
                                command.Parameters.AddWithValue(item, parameter[i]);
                                i++;
                            }
                        }
                    }


                    data = command.ExecuteNonQuery();

                    connection.Close();

                }
            }
            catch (Exception error)
            {
                MessageBox.Show(error.Message); //Them using System.Windows.Forms;
            }

            return data;
        }
    }
}
