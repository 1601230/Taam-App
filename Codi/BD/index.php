<?php
echo "WebServer ID: ";
echo gethostname();
echo "<br />\n";

#Dades necessàries per establir la connexió amb la base de dades
$dbname = "TaamAppDB";
$host = "Database";
$port = "5432";
$user = "taamapp";
$password = "taamapp";

#Variable tipus string que concatena totes les dades de connexió anteriors per poder passar-les a la funció pg_connect
$connection_string = "host=$host port=$port dbname=$dbname user=$user password=$password";

# Configure connexion
$conn = pg_connect($connection_string);

# Check connexion
if (!$conn) {
  echo "An error occurred.\n";
  exit;
}

#Creem els dos paràmetres que inserirem en la taula WebAppRequests
$nomDelWebServer = gethostname();
$dataActual = date("Y-m-d H:i:s");

# Prepare insert query
$query = "INSERT INTO public.ingredients (namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac) 
VALUES ('leche', 'llet', 'milk', 'false', 'true', 'true')";

pg_query($conn, $query);
$query = "INSERT INTO public.products (id, name) VALUES ('03124124321', 'llet de cabra')";

# Run insert query
pg_query($conn, $query);

# Run read query
$result = pg_query($conn, "SELECT COUNT(*) FROM public.ingredients WHERE namespanish = 'leche'");

if (!$result) {
  echo "An error occurred.\n";
  exit;
}

# Show results
while ($row = pg_fetch_row($result)) {
  echo "Num served requests: $row[0]";
  echo "<br />\n";
}
?>