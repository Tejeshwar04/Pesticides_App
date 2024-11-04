import 'package:flutter/material.dart';
import 'models/crop_model.dart'; // Ensure this path is correct

class CropDetailScreen extends StatelessWidget {
  final Crop crop;

  CropDetailScreen({required this.crop});

  @override
  Widget build(BuildContext context) {
    // Define the detailed pesticides data for each crop
    final pesticidesData = {
      'Paddy': {
        'Insecticides': [
          'Chlorpyrifos',
          'Imidacloprid',
          'Cartap Hydrochloride',
          'Lambda-cyhalothrin'
        ],
        'Fungicides': [
          'Tricyclazole',
          'Mancozeb',
          'Hexaconazole',
          'Propiconazole'
        ],
        'Herbicides': [
          'Pretilachlor',
          'Butachlor',
          'Bispyribac-sodium',
          'Pendimethalin'
        ],
        'Nematicides': ['Carbofuran'],
        'Rodenticides': ['Bromadiolone'],
      },
      'Wheat': {
        'Insecticides': [
          'Imidacloprid',
          'Chlorpyrifos',
          'Thiamethoxam',
          'Lambda-cyhalothrin'
        ],
        'Fungicides': [
          'Propiconazole',
          'Tebuconazole',
          'Azoxystrobin',
          'Mancozeb'
        ],
        'Herbicides': [
          '2,4-D',
          'Clodinafop-propargyl',
          'Metsulfuron-methyl',
          'Isoproturon'
        ],
        'Nematicides': ['Carbofuran'],
        'Rodenticides': ['Bromadiolone', 'Zinc phosphide'],
      },
      'Maize': {
        'Insecticides': [
          'Imidacloprid',
          'Thiamethoxam',
          'Chlorantraniliprole',
          'Spinosad'
        ],
        'Fungicides': [
          'Azoxystrobin',
          'Mancozeb',
          'Propiconazole',
          'Metalaxyl'
        ],
        'Herbicides': [
          'Atrazine',
          'Glyphosate',
          '2,4-D',
          'Mesotrione'
        ],
        'Nematicides': ['Carbofuran'],
        'Rodenticides': ['Bromadiolone'],
      },
      'Cotton': {
        'Insecticides': [
          'Imidacloprid',
          'Thiamethoxam',
          'Chlorpyrifos',
          'Spinosad',
          'Lambda-cyhalothrin'
        ],
        'Fungicides': [
          'Mancozeb',
          'Propiconazole',
          'Pyraclostrobin'
        ],
        'Herbicides': [
          'Glyphosate',
          'Pendimethalin'
        ],
        'Nematicides': ['Carbofuran'],
        'Rodenticides': ['Bromadiolone'],
      },
      'Sugarcane': {
        'Insecticides': [
          'Imidacloprid',
          'Chlorpyrifos',
          'Thiamethoxam',
          'Lambda-cyhalothrin'
        ],
        'Fungicides': [
          'Carbofuran',
          'Metamitron',
          'Propiconazole',
          'Mancozeb'
        ],
        'Herbicides': [
          'Glyphosate',
          'Atrazine'
        ],
      },
      'Banana': {
        'Insecticides': [
          'Imidacloprid',
          'Chlorpyrifos',
          'Thiamethoxam'
        ],
        'Fungicides': [
          'Carbendazim',
          'Propiconazole',
          'Mancozeb'
        ],
        'Herbicides': [
          'Glyphosate'
        ],
        'Insecticides': [
          'Spinosad',
          'Lambda-cyhalothrin'
        ],
      },
    };

    // Check if the crop data is available
    final cropPesticides = pesticidesData[crop.name] ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text('${crop.name} Details'),
        backgroundColor: Color(0xFF1A5319),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: cropPesticides.isNotEmpty
            ? ListView(
          children: cropPesticides.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A5319),
                        ),
                      ),
                      SizedBox(height: 10),
                      ...entry.value.map((pesticide) => Text(
                        '- $pesticide',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        )
            : Center(
          child: Text(
            'Pesticides data not available for ${crop.name}.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
