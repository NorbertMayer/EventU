using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EventU.Startup))]
namespace EventU
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
