using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL_DAL;
namespace GUI
{
    public partial class frmQL_DichVu : UserControl
    {
        DichVuDB dv = new DichVuDB();
        public frmQL_DichVu()
        {
            InitializeComponent();
        }
       

        private void frmQL_DichVu_Load(object sender, EventArgs e)
        {
            loadCboLoaiDV();
            loadDSDichVu();
        }
        void loadCboLoaiDV()
        {
            cbo_DV_LoaiDV.DataSource = dv.getLoaiDV();
            cbo_DV_LoaiDV.DisplayMember = "TenLoaiDV";
            cbo_DV_LoaiDV.ValueMember = "MaLoaiDV";
        }
        void loadDSDichVu()
        {

            dgrid_DV_DichVu.DataSource = dv.getDichVu();
        }

        private void dgrid_DV_DichVu_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            txt_kr_DV_MaDV.Text = dgrid_DV_DichVu.Rows[e.RowIndex].Cells[0].Value.ToString();
            cbo_DV_LoaiDV.Text = dgrid_DV_DichVu.Rows[e.RowIndex].Cells[1].Value.ToString();
            txt_kr_DV_TenDV.Text = dgrid_DV_DichVu.Rows[e.RowIndex].Cells[2].Value.ToString();
            txt_kr_DV_DonGiaDV.Text = dgrid_DV_DichVu.Rows[e.RowIndex].Cells[3].Value.ToString();
            txt_kr_DV_SoLuongDV.Text = dgrid_DV_DichVu.Rows[e.RowIndex].Cells[4].Value.ToString();
            txt_kr_DV_DVT.Text = dgrid_DV_DichVu.Rows[e.RowIndex].Cells[5].Value.ToString();
        }

        private void btn_DV_Them_Click(object sender, EventArgs e)
        {
            txt_kr_DV_DVT.Text = "";
            txt_kr_DV_DonGiaDV.Text = "";
            txt_kr_DV_MaDV.Text = "";
            txt_kr_DV_SoLuongDV.Text = "";
            txt_kr_DV_TenDV.Text = "";

            txt_kr_DV_MaDV.Focus();
        }

        private void btn_DV_Xoa_Click(object sender, EventArgs e)
        {
            DichVu dvXoa = new DichVu();
            dvXoa.MaDV = txt_kr_DV_MaDV.Text;
            dvXoa.DVT = txt_kr_DV_DVT.Text;
            dvXoa.DonGiaDV =Decimal.Parse(txt_kr_DV_DonGiaDV.Text);
            dvXoa.SoLuongCon =Int32.Parse(txt_kr_DV_SoLuongDV.Text);
            dvXoa.TenDV = txt_kr_DV_TenDV.Text;
            dvXoa.MaLoaiDV = cbo_DV_LoaiDV.ValueMember.ToString();
            DialogResult rs= MessageBox.Show("Bạn chắc chắc muốn xóa dịch vụ này","Thông báo",MessageBoxButtons.YesNo,MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                if (dv.deleteDichVu(dvXoa))
                {
                    MessageBox.Show("Xóa thành công");
                }
            }
            
        }

        private void btn_DV_Sua_Click(object sender, EventArgs e)
        {
            txt_kr_DV_DVT.Text = "";
            txt_kr_DV_DonGiaDV.Text = "";
            txt_kr_DV_MaDV.Enabled = false;
            txt_kr_DV_SoLuongDV.Text = "";
            txt_kr_DV_TenDV.Text = "";
            //DichVu dvSua = new DichVu();
            //dvSua.TenDV = txt_kr_DV_TenDV.Text;
            //dvSua.DonGiaDV =Decimal.Parse(txt_kr_DV_DVT.Text);
            //dvSua.DVT = txt_kr_DV_DVT.Text;
            //dvSua.SoLuongCon =Int32.Parse(txt_kr_DV_SoLuongDV.Text);
            //dvSua.MaLoaiDV = cbo_DV_LoaiDV.ValueMember.ToString();
            //DialogResult rs = MessageBox.Show("Bạn chắc muốn sửa","Thông báo",MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            //if (rs == DialogResult.Yes)
            //{
            //    if (dv.editDichVu(dvSua))
            //    {
            //        MessageBox.Show("Sửa thành công");
            //    }
            //}
        }

        private void btn_DV_Luu_Click(object sender, EventArgs e)
        {
            DichVu dvThem = new DichVu();
            dvThem.MaDV = txt_kr_DV_MaDV.Text;
            dvThem.TenDV = txt_kr_DV_TenDV.Text;
            dvThem.SoLuongCon = Int32.Parse(txt_kr_DV_SoLuongDV.Text);
            dvThem.DonGiaDV = Decimal.Parse(txt_kr_DV_DonGiaDV.Text);
            dvThem.DVT = txt_kr_DV_DVT.Text;
            dvThem.MaLoaiDV = cbo_DV_LoaiDV.SelectedValue.ToString();   
           if (dv.editDichVu(dvThem))
                {
                    MessageBox.Show("Đã cập nhật thành công");
                }
           if(dv.addDichVu(dvThem))
                {
                    MessageBox.Show("Đã thêm mới thành công");
                }
            
        }
    }
}
