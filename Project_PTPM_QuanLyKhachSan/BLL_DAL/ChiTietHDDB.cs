using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class ChiTietHDDB
    {
        QLKSDataContext qlks = new QLKSDataContext();

        public void deleteChiTietHD(ChiTietHD del)
        {
            try
            {
                qlks.ChiTietHDs.DeleteOnSubmit(del);
                qlks.SubmitChanges();
            }
            catch (Exception ex) { }
        }
        public List<ChiTietHD> getDsCTFromDV(string ma)
        {
            var cts = from ct in qlks.ChiTietHDs where ct.MaDV == ma select ct;
            return cts.ToList<ChiTietHD>();
        }
        public List<ChiTietHD> getDsCTFromMHD(int ma)
        {
            var cts = from ct in qlks.ChiTietHDs where ct.MaHD == ma select ct;
            return cts.ToList<ChiTietHD>();
        }
    }
}