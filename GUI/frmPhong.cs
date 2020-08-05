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
    public partial class frmMain : Form
    {
        int role;
        string username;
        LoadDatabase loaddb = new LoadDatabase();
        DangNhapDB dndb = new DangNhapDB();
        public frmMain()
        {
            InitializeComponent();
        }
        public frmMain(int role, string username)
        {
            InitializeComponent();
            falseEnableBtn();
            this.role = role;
            this.username = username;
            lblName.Text = dndb.getNameAccount(username);
            decentralize(this.role);

        }

        private void falseEnableBtn()
        {
            btnPhong.Enabled = false;
            btnQLPhong.Enabled = false;
            btnQLDV.Enabled = false;
            btnTKHD.Enabled = false;
            btnQLNV.Enabled = false;

        }

        private void decentralize(int p)
        {
            if (p == 1)
            {
                btnPhong.Enabled = true;
                btnQLPhong.Enabled = true;
                btnQLDV.Enabled = true;
                btnTKHD.Enabled = true;
                btnQLNV.Enabled = true;
            }
            else if (p == 2)
            {

                btnQLPhong.Enabled = true;
                btnQLDV.Enabled = true;
                btnTKHD.Enabled = true;
                btnQLNV.Enabled = true;
            }
            else
            {
                btnPhong.Enabled = true;
            }
        }
        //public frmMain(frmDangNhap dn)
        //{
        //    InitializeComponent();
        //    dn.Close();
        //}
        //public frmMain(frmDangNhap dn)
        //{
        //    InitializeComponent();
        //    dn.Close();
        //}
        private void frmMain_Load(object sender, EventArgs e)
        {

        }


        public void xoaText(Control ctrl)
        {
            if (ctrl is TextBox)
            {
                ctrl.Text = string.Empty;
            }
        }


        private void btnPhong_Click(object sender, EventArgs e)
        {
            tblChangefrmForBtn.Controls.Clear();
            frmPhong p = new frmPhong(username);
            tblChangefrmForBtn.Controls.Add(p);
        }

        private void btnQLPhong_Click(object sender, EventArgs e)
        {
            tblChangefrmForBtn.Controls.Clear();
            frmQL_Phong frmqlP = new frmQL_Phong();
            tblChangefrmForBtn.Controls.Add(frmqlP);
        }

        private void btnQLDV_Click(object sender, EventArgs e)
        {

        }

        private void btn_QLLoaiPh_Click(object sender, EventArgs e)
        {
            tblChangefrmForBtn.Controls.Clear();
            frmQL_LoaiPh frmLP = new frmQL_LoaiPh();
            tblChangefrmForBtn.Controls.Add(frmLP);
        }

        private void btnQLNV_Click_1(object sender, EventArgs e)
        {
            tblChangefrmForBtn.Controls.Clear();
            frmQL_NhanVien frmNV = new frmQL_NhanVien();
            tblChangefrmForBtn.Controls.Add(frmNV);
        }

        private void btnDangXuat_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn muốn đăng xuất", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
            if (rs == DialogResult.Yes)
            {
                frmMain.ActiveForm.Close();


            }
        }

        private void btnQLDV_Click_1(object sender, EventArgs e)
        {
            tblChangefrmForBtn.Controls.Clear();
            frmQL_DichVu frmDV = new frmQL_DichVu();
            tblChangefrmForBtn.Controls.Add(frmDV);
        }

    }
}