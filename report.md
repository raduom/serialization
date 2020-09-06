Results that are within 30% of the best result are displayed in **bold**.

#### deserialization (time)/BinTree Direction (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **store**               |     **1.1** |
| **flat**                |     **1.2** |
| **flat-zlib**           |     **1.2** |
| flat-pure-zlib      |     2.4 |
| cereal              |     3.7 |
| serialise           |     5.2 |
| serialise-zlib      |     5.5 |
| binary              |     6.4 |
| serialise-pure-zlib |    17.2 |

#### deserialization (time)/BinTree Int (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| **persist**             |     **1.0** |
| **flat**                |     **1.3** |
| **flat-zlib**           |     **1.3** |
| cereal              |     1.8 |
| serialise           |     3.6 |
| serialise-zlib      |     3.8 |
| flat-pure-zlib      |     4.0 |
| binary              |     4.3 |
| serialise-pure-zlib |    24.3 |

#### deserialization (time)/Cars (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **store**               |     **1.1** |
| flat                |     1.3 |
| flat-zlib           |     1.4 |
| flat-pure-zlib      |     1.8 |
| cereal              |     3.8 |
| serialise           |     5.0 |
| serialise-zlib      |     5.2 |
| binary              |     6.9 |
| serialise-pure-zlib |    13.3 |

#### deserialization (time)/Iris (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| **persist**             |     **1.1** |
| **flat**                |     **1.2** |
| flat-zlib           |     1.4 |
| serialise           |     2.2 |
| serialise-zlib      |     2.4 |
| cereal              |     3.6 |
| flat-pure-zlib      |     4.4 |
| binary              |     6.8 |
| serialise-pure-zlib |     7.1 |

#### deserialization (time)/[Direction] (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **flat**                |     **1.2** |
| **store**               |     **1.2** |
| **flat-zlib**           |     **1.2** |
| **cereal**              |     **1.2** |
| flat-pure-zlib      |     2.6 |
| binary              |     2.9 |
| serialise           |     3.0 |
| serialise-zlib      |     3.1 |
| serialise-pure-zlib |    12.7 |

#### serialization (time)/BinTree Direction (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **store**               |     **1.2** |
| flat                |     1.5 |
| flat-zlib           |     2.2 |
| flat-pure-zlib      |     2.2 |
| cereal              |     8.1 |
| binary              |    15.5 |
| serialise           |    20.4 |
| serialise-pure-zlib |    30.0 |
| serialise-zlib      |    30.1 |

#### serialization (time)/BinTree Int (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| **persist**             |     **1.0** |
| **flat**                |     **1.2** |
| flat-zlib           |     2.8 |
| flat-pure-zlib      |     2.8 |
| cereal              |    11.5 |
| binary              |    13.9 |
| serialise           |    15.7 |
| serialise-zlib      |    31.3 |
| serialise-pure-zlib |    31.4 |

#### serialization (time)/Cars (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| flat                |     1.3 |
| flat-zlib           |     1.7 |
| flat-pure-zlib      |     1.7 |
| persist             |     2.3 |
| cereal              |     4.8 |
| binary              |    10.6 |
| serialise           |    13.1 |
| serialise-pure-zlib |    24.8 |
| serialise-zlib      |    24.9 |

#### serialization (time)/Iris (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| persist             |     4.3 |
| flat                |     5.9 |
| serialise           |    13.6 |
| flat-zlib           |    16.4 |
| flat-pure-zlib      |    16.4 |
| cereal              |    17.8 |
| serialise-pure-zlib |    26.0 |
| serialise-zlib      |    26.3 |
| binary              |    77.0 |

#### serialization (time)/[Direction] (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **store**               |     **1.2** |
| flat                |     1.6 |
| flat-zlib           |     3.2 |
| flat-pure-zlib      |     3.5 |
| cereal              |     4.0 |
| binary              |     5.2 |
| serialise           |     7.9 |
| serialise-zlib      |    20.1 |
| serialise-pure-zlib |    20.3 |

#### size (bytes)/BinTree Direction (best first)

| package | performance |
| ---| ---|
| **flat-pure-zlib**      |     **1.0** |
| **flat-zlib**           |     **1.0** |
| **flat**                |     **1.0** |
| serialise-pure-zlib |     1.4 |
| serialise-zlib      |     1.4 |
| binary              |     5.7 |
| cereal              |     5.7 |
| persist             |     5.7 |
| store               |     5.7 |
| serialise           |    11.3 |

#### size (bytes)/BinTree Int (best first)

| package | performance |
| ---| ---|
| **flat-pure-zlib**      |     **1.0** |
| **flat-zlib**           |     **1.0** |
| **flat**                |     **1.1** |
| **serialise-pure-zlib** |     **1.2** |
| **serialise-zlib**      |     **1.2** |
| serialise           |     4.4 |
| binary              |     8.5 |
| cereal              |     8.5 |
| persist             |     8.5 |
| store               |     8.5 |

#### size (bytes)/Cars (best first)

| package | performance |
| ---| ---|
| **flat-pure-zlib**      |     **1.0** |
| **flat-zlib**           |     **1.0** |
| serialise-pure-zlib |     8.8 |
| serialise-zlib      |     8.8 |
| flat                |    19.9 |
| serialise           |   105.9 |
| binary              |   121.9 |
| cereal              |   121.9 |
| persist             |   121.9 |
| store               |   121.9 |

#### size (bytes)/Iris (best first)

| package | performance |
| ---| ---|
| **flat-pure-zlib**      |     **1.0** |
| **flat-zlib**           |     **1.0** |
| serialise-pure-zlib |     1.7 |
| serialise-zlib      |     1.7 |
| flat                |   120.4 |
| cereal              |   122.9 |
| persist             |   122.9 |
| store               |   122.9 |
| serialise           |   148.9 |
| binary              |   376.0 |

#### size (bytes)/[Direction] (best first)

| package | performance |
| ---| ---|
| **flat-pure-zlib**      |     **1.0** |
| **flat-zlib**           |     **1.0** |
| **serialise-pure-zlib** |     **1.1** |
| **serialise-zlib**      |     **1.1** |
| **flat**                |     **1.2** |
| binary              |     2.9 |
| cereal              |     2.9 |
| persist             |     2.9 |
| store               |     2.9 |
| serialise           |     5.8 |

#### transfer [10 MBits] (time)/BinTree Direction (best first)

| package | performance |
| ---| ---|
| **flat**                |     **1.0** |
| **flat-zlib**           |     **1.0** |
| **flat-pure-zlib**      |     **1.2** |
| serialise-zlib      |     3.4 |
| persist             |     4.1 |
| store               |     4.1 |
| cereal              |     4.9 |
| serialise-pure-zlib |     5.5 |
| binary              |     5.8 |
| serialise           |     9.6 |

#### transfer [10 MBits] (time)/BinTree Int (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| **flat**                |     **1.0** |
| **flat-pure-zlib**      |     **1.2** |
| serialise-zlib      |     2.1 |
| serialise-pure-zlib |     4.0 |
| serialise           |     4.3 |
| store               |     7.0 |
| persist             |     7.0 |
| cereal              |     7.3 |
| binary              |     7.6 |

#### transfer [10 MBits] (time)/Cars (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| **flat-pure-zlib**      |     **1.2** |
| flat                |     5.5 |
| serialise-zlib      |     6.4 |
| serialise-pure-zlib |    10.2 |
| serialise           |    28.7 |
| store               |    29.8 |
| persist             |    29.8 |
| cereal              |    31.4 |
| binary              |    33.2 |

#### transfer [10 MBits] (time)/Iris (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| serialise-zlib      |     1.7 |
| flat-pure-zlib      |     1.9 |
| serialise-pure-zlib |     3.1 |
| flat                |    33.8 |
| store               |    34.4 |
| persist             |    34.4 |
| cereal              |    35.5 |
| serialise           |    42.2 |
| binary              |   107.6 |

#### transfer [10 MBits] (time)/[Direction] (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| **flat**                |     **1.1** |
| **flat-pure-zlib**      |     **1.3** |
| serialise-zlib      |     1.9 |
| persist             |     2.2 |
| store               |     2.2 |
| cereal              |     2.3 |
| binary              |     2.7 |
| serialise-pure-zlib |     3.7 |
| serialise           |     4.7 |

#### transfer [100 MBits] (time)/BinTree Direction (best first)

| package | performance |
| ---| ---|
| **flat**                |     **1.0** |
| **flat-zlib**           |     **1.1** |
| persist             |     1.7 |
| flat-pure-zlib      |     1.7 |
| store               |     1.8 |
| cereal              |     4.0 |
| binary              |     6.3 |
| serialise-zlib      |     7.0 |
| serialise           |     7.4 |
| serialise-pure-zlib |    12.8 |

#### transfer [100 MBits] (time)/BinTree Int (best first)

| package | performance |
| ---| ---|
| **flat**                |     **1.0** |
| **flat-zlib**           |     **1.2** |
| flat-pure-zlib      |     2.2 |
| store               |     3.5 |
| persist             |     3.5 |
| serialise           |     4.7 |
| cereal              |     4.9 |
| serialise-zlib      |     5.3 |
| binary              |     6.2 |
| serialise-pure-zlib |    13.4 |

#### transfer [100 MBits] (time)/Cars (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| **flat-pure-zlib**      |     **1.2** |
| flat                |     1.5 |
| store               |     4.5 |
| persist             |     4.5 |
| serialise-zlib      |     5.8 |
| cereal              |     6.5 |
| serialise           |     7.5 |
| binary              |     8.8 |
| serialise-pure-zlib |    10.6 |

#### transfer [100 MBits] (time)/Iris (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| serialise-zlib      |     1.7 |
| flat-pure-zlib      |     2.3 |
| serialise-pure-zlib |     3.6 |
| store               |     5.0 |
| persist             |     5.1 |
| flat                |     5.1 |
| cereal              |     6.4 |
| serialise           |     6.7 |
| binary              |    18.4 |

#### transfer [100 MBits] (time)/[Direction] (best first)

| package | performance |
| ---| ---|
| **flat**                |     **1.0** |
| **flat-zlib**           |     **1.1** |
| **persist**             |     **1.2** |
| **store**               |     **1.3** |
| cereal              |     1.5 |
| flat-pure-zlib      |     1.9 |
| binary              |     2.5 |
| serialise           |     3.4 |
| serialise-zlib      |     3.5 |
| serialise-pure-zlib |     8.5 |

#### transfer [1000 MBits] (time)/BinTree Direction (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **store**               |     **1.1** |
| **flat**                |     **1.1** |
| **flat-zlib**           |     **1.3** |
| flat-pure-zlib      |     2.1 |
| cereal              |     4.1 |
| binary              |     7.3 |
| serialise           |     7.5 |
| serialise-zlib      |     9.2 |
| serialise-pure-zlib |    17.1 |

#### transfer [1000 MBits] (time)/BinTree Int (best first)

| package | performance |
| ---| ---|
| **flat**                |     **1.0** |
| **store**               |     **1.2** |
| **persist**             |     **1.2** |
| **flat-zlib**           |     **1.3** |
| flat-pure-zlib      |     2.9 |
| cereal              |     3.4 |
| serialise           |     4.9 |
| binary              |     5.2 |
| serialise-zlib      |     7.4 |
| serialise-pure-zlib |    19.5 |

#### transfer [1000 MBits] (time)/Cars (best first)

| package | performance |
| ---| ---|
| **flat**                |     **1.0** |
| **flat-zlib**           |     **1.0** |
| **store**               |     **1.2** |
| **persist**             |     **1.2** |
| **flat-pure-zlib**      |     **1.3** |
| cereal              |     3.2 |
| serialise           |     4.8 |
| binary              |     5.7 |
| serialise-zlib      |     5.7 |
| serialise-pure-zlib |    10.8 |

#### transfer [1000 MBits] (time)/Iris (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| **flat-zlib**           |     **1.1** |
| **persist**             |     **1.1** |
| **flat**                |     **1.2** |
| serialise-zlib      |     1.8 |
| serialise           |     2.0 |
| flat-pure-zlib      |     2.5 |
| cereal              |     2.6 |
| serialise-pure-zlib |     4.0 |
| binary              |     6.6 |

#### transfer [1000 MBits] (time)/[Direction] (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **store**               |     **1.2** |
| **flat**                |     **1.2** |
| flat-zlib           |     1.4 |
| cereal              |     1.6 |
| flat-pure-zlib      |     2.5 |
| binary              |     3.1 |
| serialise           |     3.5 |
| serialise-zlib      |     5.0 |
| serialise-pure-zlib |    12.6 |

