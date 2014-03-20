# Nachi

http://nachi-tool.jp/bearing product mass scraper

## Installation

Install it yourself as:

    $ gem install nachi

## Usage

* Ask for help

```bash
nachi-scraper --help
```

* By default the generated CSV is written to stdout (usually your terminal), you may redirect the output to a file for instance

```bash
nachi-scraper ~/Desktop/part-numbers.txt > ~/Desktop/item-mass.csv
```

* Specify the # of threads to use (defaults to 25)

```bash
nachi-scraper --threads 50 ~/Desktop/part-numbers.txt
```

## Contributing

1. Fork it ( http://github.com/wecodeio/nachi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
