using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(StoreFrontLab.Startup))]
namespace StoreFrontLab
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
