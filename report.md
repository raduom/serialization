Results that are within 30% of the best result are displayed in **bold**.

#### deserialization (time)/BinTree Direction (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **store**               |     **1.1** |
| **flat**                |     **1.2** |
| **flat-zlib**           |     **1.2** |
| flat-pure-zlib      |     2.3 |
| cereal              |     3.6 |
| serialise-zlib      |     6.0 |
| serialise           |     6.0 |
| binary              |     6.5 |
| serialise-pure-zlib |    16.8 |

#### deserialization (time)/BinTree Int (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| **persist**             |     **1.0** |
| **flat**                |     **1.2** |
| **flat-zlib**           |     **1.2** |
| cereal              |     1.7 |
| flat-pure-zlib      |     3.6 |
| serialise           |     3.8 |
| serialise-zlib      |     3.9 |
| binary              |     4.3 |
| serialise-pure-zlib |    22.0 |

#### deserialization (time)/Cars (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **store**               |     **1.1** |
| flat                |     1.3 |
| flat-zlib           |     1.4 |
| flat-pure-zlib      |     1.9 |
| cereal              |     3.7 |
| serialise           |     5.7 |
| serialise-zlib      |     5.9 |
| binary              |     6.7 |
| serialise-pure-zlib |    13.9 |

#### deserialization (time)/Iris (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| **persist**             |     **1.1** |
| **flat**                |     **1.1** |
| flat-zlib           |     1.4 |
| serialise           |     2.4 |
| serialise-zlib      |     2.6 |
| cereal              |     3.7 |
| flat-pure-zlib      |     4.5 |
| serialise-pure-zlib |     7.4 |
| binary              |     7.5 |

#### deserialization (time)/[Direction] (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **flat**                |     **1.0** |
| **flat-zlib**           |     **1.1** |
| **store**               |     **1.2** |
| **cereal**              |     **1.2** |
| flat-pure-zlib      |     2.3 |
| binary              |     3.0 |
| serialise           |     3.3 |
| serialise-zlib      |     3.4 |
| serialise-pure-zlib |    12.0 |

#### serialization (time)/BinTree Direction (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **store**               |     **1.1** |
| flat                |     1.5 |
| flat-zlib           |     2.1 |
| flat-pure-zlib      |     2.2 |
| cereal              |     7.7 |
| binary              |    14.8 |
| serialise           |    19.5 |
| serialise-zlib      |    28.3 |
| serialise-pure-zlib |    28.4 |

#### serialization (time)/BinTree Int (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| **persist**             |     **1.1** |
| **flat**                |     **1.1** |
| flat-pure-zlib      |     2.7 |
| flat-zlib           |     2.7 |
| cereal              |    11.5 |
| binary              |    13.8 |
| serialise           |    15.7 |
| serialise-zlib      |    30.6 |
| serialise-pure-zlib |    30.8 |

#### serialization (time)/Cars (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| flat                |     2.0 |
| persist             |     2.4 |
| flat-pure-zlib      |     2.4 |
| flat-zlib           |     2.4 |
| cereal              |     6.3 |
| binary              |    11.4 |
| serialise           |    13.2 |
| serialise-zlib      |    24.5 |
| serialise-pure-zlib |    24.9 |

#### serialization (time)/Iris (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| persist             |     3.9 |
| flat                |     5.9 |
| serialise           |    14.4 |
| flat-pure-zlib      |    16.3 |
| flat-zlib           |    16.5 |
| cereal              |    18.4 |
| serialise-pure-zlib |    26.2 |
| serialise-zlib      |    26.2 |
| binary              |    87.1 |

#### serialization (time)/[Direction] (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **store**               |     **1.1** |
| flat                |     1.5 |
| flat-pure-zlib      |     3.1 |
| flat-zlib           |     3.1 |
| cereal              |     4.7 |
| binary              |     6.0 |
| serialise           |     7.9 |
| serialise-pure-zlib |    20.1 |
| serialise-zlib      |    20.1 |

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
| persist             |     4.2 |
| store               |     4.2 |
| cereal              |     5.0 |
| serialise-pure-zlib |     5.3 |
| binary              |     5.8 |
| serialise           |     9.9 |

#### transfer [10 MBits] (time)/BinTree Int (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| **flat**                |     **1.0** |
| **flat-pure-zlib**      |     **1.2** |
| serialise-zlib      |     2.1 |
| serialise-pure-zlib |     3.8 |
| serialise           |     4.4 |
| store               |     7.1 |
| persist             |     7.1 |
| cereal              |     7.4 |
| binary              |     7.7 |

#### transfer [10 MBits] (time)/Cars (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| **flat-pure-zlib**      |     **1.2** |
| flat                |     5.6 |
| serialise-zlib      |     6.4 |
| serialise-pure-zlib |     9.9 |
| serialise           |    29.6 |
| store               |    30.6 |
| persist             |    30.7 |
| cereal              |    32.1 |
| binary              |    33.8 |

#### transfer [10 MBits] (time)/Iris (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| serialise-zlib      |     1.7 |
| flat-pure-zlib      |     1.9 |
| serialise-pure-zlib |     3.2 |
| flat                |    36.7 |
| store               |    37.3 |
| persist             |    37.4 |
| cereal              |    38.4 |
| serialise           |    45.8 |
| binary              |   117.0 |

#### transfer [10 MBits] (time)/[Direction] (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| **flat**                |     **1.1** |
| **flat-pure-zlib**      |     **1.2** |
| serialise-zlib      |     2.0 |
| persist             |     2.3 |
| store               |     2.3 |
| cereal              |     2.4 |
| binary              |     2.8 |
| serialise-pure-zlib |     3.5 |
| serialise           |     5.0 |

#### transfer [100 MBits] (time)/BinTree Direction (best first)

| package | performance |
| ---| ---|
| **flat**                |     **1.0** |
| **flat-zlib**           |     **1.1** |
| flat-pure-zlib      |     1.7 |
| persist             |     1.8 |
| store               |     1.8 |
| cereal              |     4.0 |
| binary              |     6.4 |
| serialise-zlib      |     7.2 |
| serialise           |     8.0 |
| serialise-pure-zlib |    12.6 |

#### transfer [100 MBits] (time)/BinTree Int (best first)

| package | performance |
| ---| ---|
| **flat**                |     **1.0** |
| **flat-zlib**           |     **1.1** |
| flat-pure-zlib      |     2.1 |
| store               |     3.6 |
| persist             |     3.6 |
| serialise           |     4.9 |
| cereal              |     5.0 |
| serialise-zlib      |     5.3 |
| binary              |     6.3 |
| serialise-pure-zlib |    12.7 |

#### transfer [100 MBits] (time)/Cars (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| **flat-pure-zlib**      |     **1.3** |
| flat                |     1.6 |
| store               |     4.6 |
| persist             |     4.6 |
| serialise-zlib      |     5.8 |
| cereal              |     6.5 |
| serialise           |     7.7 |
| binary              |     8.6 |
| serialise-pure-zlib |    10.2 |

#### transfer [100 MBits] (time)/Iris (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| serialise-zlib      |     1.7 |
| flat-pure-zlib      |     2.3 |
| serialise-pure-zlib |     3.7 |
| store               |     5.5 |
| flat                |     5.6 |
| persist             |     5.6 |
| cereal              |     7.0 |
| serialise           |     7.5 |
| binary              |    20.6 |

#### transfer [100 MBits] (time)/[Direction] (best first)

| package | performance |
| ---| ---|
| **flat**                |     **1.0** |
| **flat-zlib**           |     **1.1** |
| persist             |     1.3 |
| store               |     1.4 |
| cereal              |     1.8 |
| flat-pure-zlib      |     1.8 |
| binary              |     2.9 |
| serialise           |     3.9 |
| serialise-zlib      |     4.0 |
| serialise-pure-zlib |     8.8 |

#### transfer [1000 MBits] (time)/BinTree Direction (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **store**               |     **1.1** |
| **flat**                |     **1.1** |
| **flat-zlib**           |     **1.2** |
| flat-pure-zlib      |     2.0 |
| cereal              |     4.0 |
| binary              |     7.2 |
| serialise           |     7.9 |
| serialise-zlib      |     9.3 |
| serialise-pure-zlib |    16.4 |

#### transfer [1000 MBits] (time)/BinTree Int (best first)

| package | performance |
| ---| ---|
| **flat**                |     **1.0** |
| **flat-zlib**           |     **1.3** |
| **store**               |     **1.3** |
| **persist**             |     **1.3** |
| flat-pure-zlib      |     2.7 |
| cereal              |     3.4 |
| serialise           |     5.2 |
| binary              |     5.4 |
| serialise-zlib      |     7.5 |
| serialise-pure-zlib |    18.9 |

#### transfer [1000 MBits] (time)/Cars (best first)

| package | performance |
| ---| ---|
| **flat-zlib**           |     **1.0** |
| **flat**                |     **1.0** |
| **store**               |     **1.1** |
| **persist**             |     **1.2** |
| **flat-pure-zlib**      |     **1.3** |
| cereal              |     3.1 |
| serialise           |     4.9 |
| binary              |     5.3 |
| serialise-zlib      |     5.7 |
| serialise-pure-zlib |    10.3 |

#### transfer [1000 MBits] (time)/Iris (best first)

| package | performance |
| ---| ---|
| **store**               |     **1.0** |
| **flat-zlib**           |     **1.0** |
| **persist**             |     **1.1** |
| **flat**                |     **1.2** |
| serialise-zlib      |     1.8 |
| serialise           |     2.0 |
| flat-pure-zlib      |     2.4 |
| cereal              |     2.6 |
| serialise-pure-zlib |     3.9 |
| binary              |     6.9 |

#### transfer [1000 MBits] (time)/[Direction] (best first)

| package | performance |
| ---| ---|
| **persist**             |     **1.0** |
| **flat**                |     **1.0** |
| **store**               |     **1.2** |
| **flat-zlib**           |     **1.3** |
| cereal              |     1.7 |
| flat-pure-zlib      |     2.3 |
| binary              |     3.2 |
| serialise           |     3.8 |
| serialise-zlib      |     5.3 |
| serialise-pure-zlib |    12.0 |

