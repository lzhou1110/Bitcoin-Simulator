#ifndef BITCOIN_TOPOLOGY_SNAPSHOT_H
#define BITCOIN_TOPOLOGY_SNAPSHOT_H

#include <array>

namespace ns3 {
// North America, Europe, South America, Asia pacific, Japan, Australia
extern double regionLatencies[6][6];
extern std::array<double, 1001> downloadBandwitdhIntervals;
extern std::array<double, 1000> uploadBandwitdhIntervals;
extern std::array<double, 1000> EuropeDownloadWeights;
extern std::array<double, 999> EuropeUploadWeights;
extern std::array<double, 1000> AustraliaDownloadWeights;
extern std::array<double, 999> AustraliaUploadWeights;
extern std::array<double, 1000> NorthAmericaDownloadWeights;
extern std::array<double, 999> NorthAmericaUploadWeights;
extern std::array<double, 1000> SouthAmericaDownloadWeights;
extern std::array<double, 999> SouthAmericaUploadWeights;
extern std::array<double, 1000> AsiaPacificDownloadWeights;
extern std::array<double, 999> AsiaPacificUploadWeights;
extern std::array<double, 1000> JapanDownloadWeights;
extern std::array<double, 999> JapanUploadWeights;
}
#endif
