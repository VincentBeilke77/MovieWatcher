using System.Web.Optimization;

namespace MovieWatcher
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                "~/Contents/lib/jquery/jquery.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                "~/Contents/lib/bootstrap/js/bootstrap.min.js"));

            bundles.Add(new StyleBundle("~/bundles/css").Include(
                "~/Contents/lib/bootstrap/css/bootstrap.min.css"));

            BundleTable.EnableOptimizations = true;
        }
    }
}