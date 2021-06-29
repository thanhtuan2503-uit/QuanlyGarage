using System;
using DAO_QuanLy;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BUS_QuanLy
{
	public class PhieuSuaChuaBUS
	{
		private static PhieuSuaChuaBUS instance;
		private PhieuSuaChuaBUS() { }
		private DataTable VTPTDangNhap;
		public static PhieuSuaChuaBUS Instance
		{
			get { if (instance == null) instance = new PhieuSuaChuaBUS(); return instance; }
			private set { PhieuSuaChuaBUS.instance = value; }
		}
		public void KhoiTaoDtVTPTDangNhap()
		{
			VTPTDangNhap = new DataTable();
			VTPTDangNhap = TaoDataTable(3, new string[] { "ma", "slhientai", "slchophep" });
		}
		public DataTable KhoiTaoDtVTPT()
		{
			return TaoDataTable(6, new string[] { "STT", "Vật tư phụ tùng", "Số lượng", "Đơn giá", "Thành tiền", "Mã phụ tùng" });
		}

		public DataTable KhoiTaoDtTienCong()
		{
			return TaoDataTable(4, new string[] { "STT", "Nội dung", "Chi phí", "Mã tiền công" });
		}
		public DataTable TaoDataTable(int a, string[] name)
		{
			return PhieuSuaChuaDAO.Instance.TaoDataTable(a, name);
		}
		public DataTable ThemHangVTPT(DataTable dt, string VTPT, string Soluong, int DonGia, string MaPhuTung)
		{
			int a = dt.Rows.Count + 1;
			int sl = int.Parse(Soluong);
			return PhieuSuaChuaDAO.Instance.ThemHangVTPT(dt, a, VTPT, sl, DonGia, MaPhuTung);
		}

		public DataTable ThemHangTienCong(DataTable dt, string NoiDung, int ChiPhi, string MaTC)
		{
			int a = dt.Rows.Count + 1;
			return PhieuSuaChuaDAO.Instance.ThemHangTienCong(dt, a, NoiDung, ChiPhi, MaTC);
		}
		public int LayDonGiaVTPT(string maVTPT)
		{
			return PhieuSuaChuaDAO.Instance.LayDonGiaVTPT(maVTPT);
		}

		public int LayChiPhiTienCong(string maTienCong)
		{
			return PhieuSuaChuaDAO.Instance.LayChiPhiTienCong(maTienCong);
		}

		public string LayNoiDungTienCong(string maTienCong)
		{
			return PhieuSuaChuaDAO.Instance.LayNoiDungTienCong(maTienCong);
		}
		public void LuuPhieuSuaChua(string BienSo, int TienCong, int TienPhuTung, int TongTien, DataTable TC, DataTable VTPT)//Lưu dữ liệu được nhập vào 2 bảng PHIEUSUACHUA và CHITIETPHIEUSUACHUA
		{
			PhieuSuaChuaDAO.Instance.LuuPhieuSuaChua(BienSo, TienCong, TienCong, TongTien, TC, VTPT);

		}

		public void CapNhapVTPT(DataTable VTPT)
		{
			PhieuSuaChuaDAO.Instance.CapNhapVTPT(VTPT);
		}
		public bool KiemTraSoLuong(string MaVTPT, int SoLuong)//Kiểm tra số lượng nhập vào có nằm trong khả năng đáp ứng của kho.
		{
			bool TonTai = false;
			int Tong = 0;
			foreach (DataRow row in VTPTDangNhap.Rows)
			{
				if (row["ma"].ToString() == MaVTPT)
				{
					TonTai = true;
					Tong = SoLuong + int.Parse(row["slhientai"].ToString());
					if (Tong > int.Parse(row["slchophep"].ToString()))
					{
						return false;
					}
					else
					{
						row["slhientai"] = Tong.ToString();
					}
				}
			}
			if (!TonTai)
			{
				return PhieuSuaChuaDAO.Instance.KiemTraSoLuong(VTPTDangNhap, MaVTPT, SoLuong);
			}
			return true;
		}
		public void XoaDtVTPTDangNhap()
		{
			VTPTDangNhap.Clear();
		}
		public void CapNhatTienNo(string BienSo, int TienSuaChua)
		{
			PhieuSuaChuaDAO.Instance.CapNhatTienNo(BienSo, TienSuaChua);
		}

	}

}
