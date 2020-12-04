using System;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.DependencyInjection;

namespace Dummy.Web
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var host = CreateHostBuilder(args).Build();
            ILogger log = host.Services.GetService<ILogger<Program>>();
            try
            {
                log.LogInformation("Getting started...");
                log.LogInformation("Database Url: ", Environment.GetEnvironmentVariable("ConnectionString"));
                host.Run();
            }
            catch(Exception ex)
            {
                log.LogCritical(ex, "Host terminated unexpectedly");
            }
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseUrls(Urls()).UseStartup<Startup>();
                });

        private static string Urls()
        {
            if (string.IsNullOrEmpty(Environment.GetEnvironmentVariable("PORT")))
            {
                return "http://0.0.0.0:5000";
            }
            else
            {
                return $"http://0.0.0.0:{Environment.GetEnvironmentVariable("PORT")}";
            }
        }
    }
}
