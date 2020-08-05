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
    public partial class frmDangNhap : Form
    {

        DangNhapDB dangnhap = new DangNhapDB();
        frmMain main;


        public frmDangNhap()
        {
            InitializeComponent();
            xoaText(pnlDN);  // xoá text trong các textbox của frm đăng nhập.
        }


        private void btnClose_Click_1(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn chắc muốn thoát", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                frmDangNhap.ActiveForm.Close();
            }
        }

        bool checkDangNhap()
        {
            if (string.IsNullOrEmpty(txtTK.Text))
            {
                MessageBox.Show("Tài khoảng không được bỏ trống");
                return false;
            }
            else if (string.IsNullOrEmpty(txtMK.Text))
            {
                MessageBox.Show("Mật khẩu không được bỏ trống");
                return false;
            }
            return true;
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            if (checkDangNhap() == true)
            {
                int rs = dangnhap.ktraDangNhap(txtTK.Text, txtMK.Text);
                if (rs == 0)
                {
                    MessageBox.Show("Tài khoản không tồn tại!!!");
                }
                else if (rs == -1)
                {
                    MessageBox.Show("Mật khẩu  không hợp lệ!!!");
                }
                else
                {

                    loginSuccess(rs, txtTK.Text);
                }
            }

        }

        private void loginSuccess(int rs, string username)
        {
            main = new frmMain(rs, username);
            main.Show(this);
            MessageBox.Show("Đăng nhập thành công!");

        }
        public void xoaText(Control ctrl)
        {
            if (ctrl is TextBox)
            {
                ctrl.Text = string.Empty;
            }
        }
        private void txtMK_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == 13)
            {
                btnDangNhap_Click(sender, e);
            }
        }

        private void frmDangNhap_Load(object sender, EventArgs e)
        {

        }
      
    }
}
