﻿using ManageStore.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManageStore.DAO
{
    class HouseDAO
    {
        private static HouseDAO instance;

        public static HouseDAO Instance
        {
            get { if (instance == null) instance = new HouseDAO(); return HouseDAO.instance; }
            private set => instance = value;
        }

        private HouseDAO() { }
        public List<House> GetListHouse()
        {
            List<House> list = new List<House>();
            string query = "SELECT * FROM dbo.NHA";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                House house = new House(item);
                list.Add(house);
            }

            return list;
        }
        public List<House> SearchHouseByID(int idnha)
        {
            List<House> list = new List<House>();
            string query = string.Format("SELECT * FROM dbo.NHA WHERE IDNHA = {0}", idnha);
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                House house = new House(item);
                list.Add(house);
            }

            return list;
        }
        public bool InsertHouse(int id, int idchinhanh, string ten, string sdt, string gioitinh, DateTime? ngaysinh, float luong, string diachi)
        {
            //string query = string.Format("INSERT dbo.Food ( name, idCategory, price )VALUES  ( N'{0}', {1}, {2})", name, id, price);
            string query = string.Format("INSERT dbo.NHANVIEN(IDNV,IDCNHANH,TENNV,DIENTHOAINV,GIOITINHNV,NGAYSINHNV,LUONGNV,DIACHINV) VALUES({0},{1},N'{2}',N'{3}',N'{4}',N'{5}',{6},N'{7}')", id, idchinhanh, ten, sdt, gioitinh, ngaysinh, luong, diachi);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }
        public bool UpdateHouse(int id, int idchinhanh, string ten, string sdt, string gioitinh, DateTime? ngaysinh, float luong, string diachi)
        {
            string query = string.Format("UPDATE dbo.NHANVIEN SET IDCNHANH = {0}, TENNV = N'{1}', DIENTHOAINV = N'{2}',GIOITINHNV = N'{3}',NGAYSINHNV= N'{4}', LUONGNV={5},DIACHINV= N'{6}' WHERE IDNV = {7}", idchinhanh, ten, sdt, gioitinh, ngaysinh, luong, diachi, id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }
        public bool DeleteHouse(int idHouse)
        {


            string query = string.Format("Delete NHA where IDNHA = {0}", idHouse);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }
    }
}
