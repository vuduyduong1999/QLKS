using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class BangGiaPhongDB
    {
        QLKSDataContext qlks = new QLKSDataContext();
        public List<BangGiaPhong> getDsBGPFromLP(string ma)
        {
            var cts = from ct in qlks.BangGiaPhongs where ct.MaLoaiPhong == ma select ct;
            return cts.ToList<BangGiaPhong>();
        }
        public void deleteBangGiaPhong(BangGiaPhong del)
        {
            try
            {
                qlks.BangGiaPhongs.DeleteOnSubmit(del);
                qlks.SubmitChanges();
            }
            catch (Exception ex) { }
        }
    }
}
