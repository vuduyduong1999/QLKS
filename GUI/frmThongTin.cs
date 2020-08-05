using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL_DAL;
namespace GUI
{
    public partial class frmThongTin : Form
    {
        LoaiDichVuDB lddb = new LoaiDichVuDB();
        DichVuDB dvdb = new DichVuDB();
        PhongDB pdb = new PhongDB();
        string map, username;
        public frmThongTin()
        {
            InitializeComponent();
        }
        public frmThongTin(string map, string user)
        {
            InitializeComponent();
            this.map = map;
            this.username = user;
            loadTitle();
            loadCBOLoaiDV();

        }

        private void LoadSLCon()
        {
            try
            {
                dud_kr_DP_SoLuong.Text = "" + dvdb.getDichVuFromMa(cbo_kr_DP_DV.SelectedValue.ToString()).SoLuongCon;
            }
            catch (Exception ex)
            { }
        }

        private void loadCBODV()
        {
            cbo_kr_DP_DV.DataSource = dvdb.getDichVuFromMaLDV(cbo_kr_DP_LoaiDV.SelectedValue.ToString());
            cbo_kr_DP_DV.ValueMember = "TenDV";
            cbo_kr_DP_DV.DisplayMember = "MaDV";
        }

        private void loadCBOLoaiDV()
        {
            cbo_kr_DP_LoaiDV.DataSource = lddb.getDsLDV();
            cbo_kr_DP_LoaiDV.DisplayMember = "TenLoaiDV";
            cbo_kr_DP_LoaiDV.ValueMember = "MaLoaiDV";
        }

        private void loadTitle()
        {
            string name = pdb.getPhongFromMa(map).TenPhong;
            this.lbl_TenPhong.Text = name;
        }

        private void kryptonButton1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_kr_DP_DatPhong_Click(object sender, EventArgs e)
        {
            if (btn_kr_DP_DatPhong.Text.Equals("Thanh toán"))
            {
                frmThanhToan frmThanhToan = new frmThanhToan();
                frmThanhToan.Show();
            }
            else
            {
                KhachHang khm = new KhachHang();
                khm.CMND = txt_kr_DP_CMND.Text;
                khm.TenKH = txt_kr_DP_HoTen.Text;
                khm.NgayCapCMND = dtPicker_kr_NgayCap.Value;
                khm.NgaySinhKH = dtPicker_kr_DP_NgaySinh.Value;
                if (rdo_kr_DP_Nam.Checked)
                    khm.GioiTinhKH = "Nam";
                else
                    khm.GioiTinhKH = "Nữ";
                khm.DienThoaiKH = txt_kr_DP_SDT.Text;
                khm.DiaChi = txt_kr_DP_DiaChi.Text;
                khm.NoiCap = txt_kr_DP_NoiCap.Text;
                khm.QuocTichKH = txt_kr_DP_QuocTich.Text;
                KhachHangDB khdb = new KhachHangDB();
                if (khdb.addKhachHang(khm))
                {

                }
                else
                {
                    MessageBox.Show("Thất bại");
                }

            }
        }

        private void cbo_kr_DP_LoaiDV_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadCBODV();
        }

        private void cbo_kr_DP_DV_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSLCon();
        }






    }
}