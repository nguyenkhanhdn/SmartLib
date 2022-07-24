using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SmartLib.Startup))]
namespace SmartLib
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
