using Ecommerce.Client.API.Configuration;
using Serilog;

try
{
    var builder = WebApplication.CreateBuilder(args);

    // Add services to the container.

    using IHost host = Host.CreateDefaultBuilder(args).Build();
    IConfiguration config = host.Services.GetRequiredService<IConfiguration>();


    string connectionString = config["ConnectionStrings:DefaultConnection"]
                              ?? throw new ArgumentNullException("ConnectionStrings:DefaultConnection is null");

    // Services Injections
    builder.Services.AddInfrastructure(connectionString);

    // Serilog Configuration
    builder.Host.UseSerilog((context, config) => config.ReadFrom.Configuration(context.Configuration));

    builder.Services.AddControllers();
    builder.Services.AddEndpointsApiExplorer();
    builder.Services.AddSwaggerGen();

    builder.Services.AddAuthentication();

    var app = builder.Build();

    // Configure the HTTP request pipeline.
    if (app.Environment.IsDevelopment())
    {
        app.UseSwagger();
        app.UseSwaggerUI();
    }

    app.UseSerilogRequestLogging();
    app.UseHttpsRedirection();
    app.UseAuthorization();
    app.MapControllers();
    app.Run();
}
catch (Exception ex)
{
    Log.Fatal(ex, "Error in Program.cs");
}
finally
{
    Log.Information("Shut down complete");
    Log.CloseAndFlush();
}