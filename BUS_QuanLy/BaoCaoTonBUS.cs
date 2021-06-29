using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO_QuanLy;
using System.Data;

namespace BUS_QuanLy
{
    public class BaoCaoTonBUS
    {
        private static BaoCaoTonBUS instance;
        private BaoCaoTonBUS() { }
        public static BaoCaoTonBUS Instance
        {
            get { if (instance == null) instance = new BaoCaoTonBUS(); return instance; }
            private set { BaoCaoTonBUS.instance = value; }
        }
        public DataTable KhoiTaoBaoCaoTon() { 
            DataTable dt = PhieuSuaChuaDAO.Instance.TaoDataTable(6, new string[] { "STT", "Mã", "Vật tư phụ tùng", "Tồn đầu", "Phát sinh", "Tồn cuối" });
            return dt;
        }

        public DataTable ThemHangBaoCaoTon(DataTable a, int ma, string vtpt, int TonDau, int PhatSinh, int TonCuoi)
        {
            DataRow dr = a.NewRow();
            dr["STT"] = a.Rows.Count;
            dr["Mã"] = ma;
            dr["Vật tư phụ tùng"] = vtpt;
            dr["Tồn đầu"] = TonDau;
            dr["Phát sinh"] = PhatSinh;
            dr["Tồn cuối"] = TonCuoi;
            a.Rows.Add(dr);
            return a;
        }

        public DataTable LayDtKHO()
        {
            return BaoCaoTonDAO.Instance.LayDtKHO();
        }

        public bool KiemTraThoiDiem(DateTime a)
        {
            return BaoCaoTonDAO.Instance.KiemTraThoiDiem(a);
        }

        public void TaoBaoCaoMoi(DataTable a)
        {
            a.Clear();
        }

        public int SoLuongNhapVao(int MaPhuTung, int Thang, int Nam)
        {
            return BaoCaoTonDAO.Instance.SoLuongNhapVao(MaPhuTung, Thang, Nam);
        }

        public int SoLuongBanRa(int MaPhuTung, int Thang, int Nam)
        {
            return BaoCaoTonDAO.Instance.SoLuongBanRa(MaPhuTung, Thang, Nam);
        }

        public int SoLuongPhatSinh(int MaPhuTung, int Thang, int Nam)
        {
            return SoLuongNhapVao(MaPhuTung, Thang, Nam) - SoLuongBanRa(MaPhuTung, Thang, Nam);
        }

        public int LuongTonDauThang(int MaPhuTung, int Thang, int Nam)
        {
            return BaoCaoTonDAO.Instance.LuongTonDauThang(MaPhuTung, Thang, Nam);
        }

        public int LuongTonCuoiThang(int MaPhuTung, int Thang, int Nam)
        {
            return LuongTonDauThang(MaPhuTung, Thang, Nam) + SoLuongPhatSinh(MaPhuTung, Thang, Nam);
        }

        public void NhapBaoCaoTon(DataTable a, DateTime b)
        {
            BaoCaoTonDAO.Instance.NhapBaoCaoTon(a, b);
        }

        public DataTable TaoBaoCaoTon(DateTime b)
        {
            DataTable a;
            a = KhoiTaoBaoCaoTon();
            DataTable dt = LayDtKHO();
            foreach (DataRow row in dt.Rows)
            {
                a = ThemHangBaoCaoTon(a, int.Parse(row["MaPhuTung"].ToString()), row["TenVatTuPhuTung"].ToString(), LuongTonDauThang(int.Parse(row["MaPhuTung"].ToString()), b.Month, b.Year), SoLuongPhatSinh(int.Parse(row["MaPhuTung"].ToString()), b.Month, b.Year), LuongTonCuoiThang(int.Parse(row["MaPhuTung"].ToString()), b.Month, b.Year));
            }
            return a;
        }

        public DataTable TruyXuatBaoCaoTon(DateTime a)
        {
            DataTable dt = BaoCaoTonDAO.Instance.TruyXuatBaoCaoTon(a);
            DataTable b = KhoiTaoBaoCaoTon();
            foreach (DataRow row in dt.Rows)
            {
                b = ThemHangBaoCaoTon(b, int.Parse(row["MaPhuTung"].ToString()), row["TenVatTuPhuTung"].ToString(), int.Parse(row["TonDau"].ToString()), int.Parse(row["PhatSinh"].ToString()), int.Parse(row["TonCuoi"].ToString()));
            }
            return b;
        }

        public bool KiemTraDuLieuBaoCao(DateTime a)
        {
            return BaoCaoTonDAO.Instance.KiemTraDuLieuBaoCao(a);
        }

        public bool ThangDauTien()
        {
            return BaoCaoTonDAO.Instance.ThangDauTien();
        }
    }
}